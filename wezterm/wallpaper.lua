local wezterm = require("wezterm")
local M = {}

--- Config structure with sensible defaults
---@class WallpaperConfig
---@field paths table the paths to collect images from
---@field interval integer the interval in seconds to change the background image
---@field max_depth integer the maximum depth to search for images in directories (0 for the directory itself only)
---@field opacity number the opacity of the background image (0 to 1)
---@field layers table the layers config for the background, with 'image_layer' as a placeholder
---@field extensions table the file extensions to consider as images (case-insensitive)
local WallpaperConfig = {
    paths = {},
    interval = 30,
    max_depth = 1,
    opacity = 1,
    layers = { "image_layer" },
    -- Exclude WebP as it's not supported yet (pending PR)
    -- https://github.com/wezterm/wezterm/pull/7694
    extensions = { ".png", ".jpg", ".jpeg", ".bmp", ".gif" },
}
WallpaperConfig.__index = WallpaperConfig

--- Generate default config
---@return table the default config
function M.create_config()
    local self = setmetatable({}, WallpaperConfig)
    return self
end

--- Append elements of one table to another
---@param dst table the destination table to append to
---@param src table the source table to append from
---@return table the destination table after appending
local function append_table(dst, src)
    for _, v in ipairs(src) do
        table.insert(dst, v)
    end
end

--- Check if the path is a directory
---@param path string the path to the directory to check
---@return boolean true if the path is a directory, false otherwise
local function is_directory(path)
    local ok, res = pcall(wezterm.read_dir, path)
    return ok and type(res) == "table"
end

--- Check if the file is an image by its extension
-- path: path to check that is an image
---@param path string the path to the file to check
---@return boolean true if the file is an image, false otherwise
local function is_image(path)
    local lower_path = path:lower()
    for _, ext in ipairs(WallpaperConfig.extensions) do
        if lower_path:sub(-#ext) == ext then
            return true
        end
    end
    return false
end

--- Scans a directory for children
-- path: directory to scan to collect files
---@param path string the path to the directory to scan
---@return table a table of file paths in the directory, or an empty table if the directory cannot be read
local function get_files(path)
    local ok, res = pcall(wezterm.read_dir, path)
    if ok and type(res) == "table" then
        return res
    end
    wezterm.log_error("Failed to read directory: " .. path)
    return {}
end

--- Recursively scans a directory to collect file paths
---@param dir integer directory to scan
---@param depth integer Maximum search depth (0 for the directory itself only)
---@return table a table of file paths in the directory and its subdirectories up to the specified depth
local function collect_files(dir, depth)
    local filtered_files = {}
    local files = get_files(dir)

    for _, path in ipairs(files) do
        if is_directory(path) then
            if depth > 0 then
                local sub_files = collect_files(path, depth - 1)
                append_table(filtered_files, sub_files)
            end
        else
            table.insert(filtered_files, path)
        end
    end
    return filtered_files
end

--- Recursively scans a directory to collect image paths
---@param dir integer directory to scan
---@param depth integer Maximum search depth (0 for the directory itself only)
---@return table a table of image paths in the directory and its subdirectories up to the specified depth
local function collect_images(dir, depth)
    local imgs = {}
    if is_directory(dir) then
        local files = collect_files(dir, depth)
        for _, path in ipairs(files) do
            if is_image(path) then
                table.insert(imgs, path)
            end
        end
    else
        if is_image(dir) then
            table.insert(imgs, dir)
        end
    end
    return imgs
end

--- Check if a value exists in a table
---@param tab table the table to check for the value
---@param val any the value to check for existence in the table
---@return boolean true if the value exists in the table, false otherwise
local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

--- Replace 'image_layer' in the layers config with the actual image layer
---@param orig_layers table the original layers config
---@param image_layer table the image layer to replace 'image_layer' with
---@return table a new layers config with 'image_layer' replaced by the provided image layer
local function get_layers(orig_layers, img_layer)
    local layers = {}
    for i, layer in ipairs(orig_layers) do
        if layer == "image_layer" then
            layers[i] = img_layer
        else
            layers[i] = layer
        end
    end
    return layers
end

local last_image = nil
local images = {}
--- Update the background image of the window based on the provided config, only if the image has changed
---@param window wezterm.Window the window to update the background image for
---@param config WallpaperConfig the configuration for the wallpaper
local function update_background(window, config)
    if #images == 0 then
        wezterm.log_info("Checking " .. #config.paths .. " paths for new background...")

        for i, path in ipairs(config.paths) do
            local _images = collect_images(path, config.max_depth)
            append_table(images, _images)
        end

        if #images == 0 then
            wezterm.log_error("Not found any images.")
            return
        end

        wezterm.log_info("Found " .. #images .. " images.")
    end

    if #images > 0 then
        local random_image = images[math.random(#images)]
        -- Only change background when the image changed
        if random_image ~= last_image then
            local img_layer = {
                source = {
                    File = random_image,
                },
                opacity = config.opacity,
            }
            local layers = get_layers(config.layers, img_layer)
            window:set_config_overrides({
                background = layers,
            })
            wezterm.log_info("Background changed to: " .. random_image)
            last_image = random_image
        end
    end
end

local cur_cfg = nil
local last_update = 0
-- Register periodic updater
wezterm.on("update-status", function(window, pane)
    local now = os.time()
    if cur_cfg and now - last_update >= cur_cfg.interval then
        last_update = now
        update_background(window, cur_cfg)
    end
end)

-- Update the background with scheduled timer
---@field config WallpaperConfig
function M.setup(config)
    cur_cfg = config
    math.randomseed(os.time() + os.clock() * 1000)
    last_update = 0
end

return M

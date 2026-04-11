local LspConfig = {
    name = nil,
    init = nil,
    config = nil,
    enable = true,
}
LspConfig.__index = LspConfig

---@param config LspConfig lsp configuration to initialize
local function load_lsp_config(config)
    local config = setmetatable(config, LspConfig)
    if config.name == nil then
        error("Lsp Name is nil")
    end
    if not vim.lsp.config[config.name] then
        vim.notify("LSP: " .. config.name .. " wss not found, skipped.", vim.log.levels.WARN, { title = "Lsp Config" })
    end

    if config.config ~= nil then
        vim.lsp.config(config.name, config.config)
    end

    if type(config.init) == "function" then
        config.init()
    end

    if config.enable then
        vim.lsp.enable(config.name)
    end
end

local function load_lsp_configs(configs)
    for _, config in ipairs(configs) do
        load_lsp_config(config)
    end
end

load_lsp_configs({
    -- JS/TS/JSON/CSS/HTMLのフォーマットのみ
    require("plugins.config.lsp.lspconfig.biome"),
    -- 型チェックと補完のみ
    require("plugins.config.lsp.lspconfig.vtsls"),
    -- Biome未対応言語のみに
    require("plugins.config.lsp.lspconfig.eslint"),
    -- JSONのスキーマ検証(整形はBiome)
    require("plugins.config.lsp.lspconfig.jsonls"),
    -- htmlタグ補完用(整形はBiome)
    require("plugins.config.lsp.lspconfig.html"),
    -- CSS補完用(整形はBiome)
    require("plugins.config.lsp.lspconfig.cssls"),
})

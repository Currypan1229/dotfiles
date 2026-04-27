local M = {}

---@class Keymap
---@param mode string
---@param key string
---@param func function
---@param desc string | nil]
local Keymap = {
    key = nil,
    func = nil,
    mode = "n",
    desc = nil,
    remap = false,
    expr = false,
    silent = true,
    nowait = false,
    buffer = nil,
}
Keymap.__index = Keymap

---@return Keymap
function Keymap.new(keymap)
    return setmetatable(keymap, Keymap)
end

function M:new()
    ---@param keymaps Keymap[]
    local instance = {
        keymaps = {},
    }

    function instance:register_keymap(keymap)
        local func = keymap.func
        keymap.func = function()
            local timer = vim.uv.new_timer()
            timer:start(0, 0, function()
                func()
                timer:stop()
                timer:close()
            end)
        end

        table.insert(self.keymaps, Keymap.new(keymap))
    end

    function instance:as_lazy()
        local keymaps = {}

        for i, keymap in ipairs(self.keymaps) do
            local lazy_keymap = Keymap.new({
                key = keymap.key,
                func = keymap.func,
                mode = keymap.mode,
                desc = keymap.desc,
                remap = keymap.remap,
                expr = keymap.expr,
                silent = keymap.silent,
                nowait = keymap.nowait,
                buffer = keymap.buffer,
            })

            keymaps[i] = lazy_keymap
        end

        return keymaps
    end

    function instance:as_vim()
        local keymaps = {}
        return keymaps
    end

    return instance
end

return M

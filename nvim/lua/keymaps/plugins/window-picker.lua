local keys = {}

table.insert(keys, {
    "<leader>ow",
    function()
        local window_id = require("window-picker").pick_window()
        if window_id then
            vim.api.nvim_set_current_win(window_id)
        end
    end,
})

return keys

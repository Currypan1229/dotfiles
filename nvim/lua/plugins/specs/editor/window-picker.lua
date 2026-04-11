return {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    keys = {
        {
            "<leader>ow",
            function()
                local window_id = require("window-picker").pick_window()
                if window_id then
                    vim.api.nvim_set_current_win(window_id)
                end
            end,
        },
    },
    config = function()
        require("plugins.config.editor.window-picker")
    end,
}

return {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    keys = require("keymaps.plugins.window-picker"),
    config = function()
        require("plugins.config.editor.window-picker")
    end,
}

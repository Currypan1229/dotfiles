return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("plugins.config.ui.catppuccin")
    end,
}

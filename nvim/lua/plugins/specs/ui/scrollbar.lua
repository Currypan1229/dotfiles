return {
    "petertriho/nvim-scrollbar",
    event = { "VeryLazy" },
    config = function()
        require("plugins.config.ui.scrollbar")
    end,
}

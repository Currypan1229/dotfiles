return {
    "levouh/tint.nvim",
    events = { "BufReadPost" },
    config = function()
        require("plugins.config.ui.tint")
    end,
}

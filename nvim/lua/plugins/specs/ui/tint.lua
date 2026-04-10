return {
    "levouh/tint.nvim",
    event = { "WinEnter","BufEnter" },
    config = function()
        require("plugins.config.ui.tint")
    end,
}

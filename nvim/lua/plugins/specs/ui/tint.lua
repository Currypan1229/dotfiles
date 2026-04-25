return {
    "sheimer/tint.nvim",
    event = { "WinEnter","BufEnter" },
    config = function()
        require("plugins.config.ui.tint")
    end,
}

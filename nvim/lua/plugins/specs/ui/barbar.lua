return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    version = "^1.0.0",
    events = { "BufReadPost" },
    config = function()
        require("plugins.config.ui.barbar")
    end,
}

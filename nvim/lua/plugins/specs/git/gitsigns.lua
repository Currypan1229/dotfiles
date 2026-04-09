return {
    "lewis6991/gitsigns.nvim",
    event = { "VeryLazy" },
    config = function()
        require("plugins.config.git.gitsigns")
    end
}

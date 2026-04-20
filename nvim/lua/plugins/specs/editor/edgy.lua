return {
    "folke/edgy.nvim",
    event = { "VeryLazy" },
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    config = function()
        require("plugins.config.editor.edgy")
    end,
}

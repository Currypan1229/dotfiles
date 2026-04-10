return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    events = { "BufReadPost" },
    ft = { "markdown" },
    config = function()
        require("plugins.config.editor.render-markdown")
    end,
}

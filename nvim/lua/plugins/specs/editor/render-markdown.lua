return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "VeryLazy" },
    config = function()
        require("plugins.config.editor.render-markdown")
    end,
}

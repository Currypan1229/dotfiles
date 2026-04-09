return {
    "nvimtools/none-ls.nvim",
    event = { "VeryLazy" },
    config = function()
        require("plugins.config.lsp.none-ls")
    end,
}

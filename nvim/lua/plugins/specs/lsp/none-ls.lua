return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("plugins.config.lsp.none-ls")
    end,
}

return {
    "nvimtools/none-ls.nvim",
    events = { "BufReadPost", "BufNewFile" },
    config = function()
        require("plugins.config.lsp.none-ls")
    end,
}

return {
    "mason-org/mason.nvim",
    event = { "VeryLazy" },
    build = ":MasonUpdate",
    opts = {},
    config = function()
        require("plugins.config.lsp.mason")
    end,
}

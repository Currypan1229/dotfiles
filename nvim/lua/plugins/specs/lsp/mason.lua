return {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
    config = function ()
        require("mason").setup()
        require("mason-lspconfig").setup()
    end
}

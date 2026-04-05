require("mason-null-ls").setup({
    ensure_installed = {
        "stylua",
        "prettier",
        "shfmt",
        "sql-formatter",
        "black",
    },
    automatic_installation = true,
})

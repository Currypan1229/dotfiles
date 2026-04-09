require("mason-null-ls").setup({
    ensure_installed = {
        "stylua",
        "prettier",
        "shfmt",
        "sql-formatter",
        "black",
        "kube-linter"
    },
    automatic_installation = true,
})

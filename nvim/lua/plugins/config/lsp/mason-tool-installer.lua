local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ";" .. vim.env.PATH

require("mason-tool-installer").setup({
    ensure_installed = {
        "stylua",
        "black",
        "prettier",
        "shfmt",
        "google-java-format",
        "sql-formatter",
        "marksman",
    },
    auto_install = true,
    run_on_start = true,
})

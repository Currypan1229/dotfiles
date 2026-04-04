local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ";" .. vim.env.PATH

require("mason-tool-installer").setup({
    ensure_installed = {
        "stylua",
        "prettier",
        "shfmt",
        "sql-formatter",
        "marksman",
        "black",

        "lazygit",
        "ripgrep"
    },
    auto_install = true,
    run_on_start = true,
})

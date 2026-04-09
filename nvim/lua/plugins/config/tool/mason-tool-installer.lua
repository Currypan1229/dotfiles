require("mason-tool-installer").setup({
    ensure_installed = {
        "lazygit",
        "ripgrep",
    },
    auto_update = true,
    run_on_start = true,
})

vim.cmd(":MasonToolsInstall")

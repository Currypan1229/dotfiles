require("mason-nvim-dap").setup({
    ensure_installed = {
        "java-debug-adapter",
        "js-debug-adapter",
    },
    automatic_installation = true,
})


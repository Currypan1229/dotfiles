vim.lsp.config("biome", {
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
        "css",
        "html",
    },
    settings = {
        biome = {
            lint = {
                enabled = false,
            },
        },
    },
})
vim.lsp.enable("biome")


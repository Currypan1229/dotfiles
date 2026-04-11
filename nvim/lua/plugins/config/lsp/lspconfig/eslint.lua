vim.lsp.config("eslint", {
    filetypes = {
        "vue",
        "svelte",
        "astro",
        "markdown",
        "yaml",
        "graphql",
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
    end,
    settings = {
        workingDirectories = { mode = "auto" },
    },
})
vim.lsp.enable("eslint")


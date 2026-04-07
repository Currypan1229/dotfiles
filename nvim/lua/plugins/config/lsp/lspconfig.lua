-- JS/TS/JSON/CSS/HTML
-- フォーマットのみ
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

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    severity_sort = true,
    show_header = true,
})

-- 型チェックと補完のみ
vim.lsp.config("vtsls", {
    on_attach = function(client, bufnr)
        -- フォーマット無効化 (Biomeがする)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- ハイライトをオフ (Treesitterがする)
        client.server_capabilities.semanticTokensProvider = nil

        -- インポート整理を無効化 (Biomeがする)
        client.server_capabilities.codeActionProvider = {
            codeActionKinds = {
                "quickfix",
                "refactor",
                -- "source.organizeImports" を含めないことでBiomeと衝突させない
            },
        }
    end,
    settings = {
        vtsls = {
            autoUseWorkspaceTsdk = true,
            experimental = {
                completion = {
                    enableServerSideFuzzyMatch = true,
                },
            },
        },
        javascript = {
            suggest = {
                completeFunctionCalls = true,
            },
            inlayHints = {
                parameterNames = { enabled = "all" },
            },
            validate = true,
        },
        typescript = {
            suggest = {
                completeFunctionCalls = true,
            },
            inlayHints = {
                parameterNames = { enabled = "all" },
            },
            validate = true,
        },
    },
})
vim.lsp.enable("vtsls")

-- Biome未対応言語のみに
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

-- JSONのスキーマ検証(整形はBiome)
vim.lsp.config("jsonls", {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
vim.lsp.enable("jsonls")

-- 5. html: タグ補完用(整形はBiome)
vim.lsp.config("html", {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
vim.lsp.enable("html")

-- 6. cssls: CSS補完用(整形はBiome)
vim.lsp.config("cssls", {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
vim.lsp.enable("cssls")

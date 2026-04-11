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

local util = require('lspconfig.util')

return {
    name = "biome",
    config = {
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.documentRangeFormattingProvider = true
        end,
        filetypes = {
            "astro",
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            --"svelte",
            "typescript",
            "typescriptreact",
            "vue",
        },
        root_dir = function(bufnr, on_dir)
            local root_markers = {
                "package-lock.json",
                "yarn.lock",
                "pnpm-lock.yaml",
                "bun.lockb",
                "bun.lock",
                "deno.lock",
            }
            local biome_config_files = { "biome.json", "biome.jsonc" }
            root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, biome_config_files, { ".git" } }
                or vim.list_extend(root_markers, vim.list_extend(biome_config_files, { ".git" }))

            local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

            local filename = vim.api.nvim_buf_get_name(bufnr)
            biome_config_files = util.insert_package_json(biome_config_files, "biomejs", filename)

            on_dir(project_root)
        end,
        settings = {
            biome = {
                lint = {
                    enabled = false,
                },
            },
        },
        initialization_options = {
            configuration = {
                formatter = {
                    enabled = true,
                    formatWithErrors = true,
                    indentStyle = "space",
                    indentWidth = 4,
                    lineWidth = 80,
                },
            },
        },
        workspace_required = false,
    },
}

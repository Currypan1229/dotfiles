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
            "scss",
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
            files = {
                includes = { "**", "!node_modules/**", "!**/*.svelte" },
            },
            formatter = {
                enabled = true,
                formatWithErrors = true,
                lineWidth = 80,
                useEditorconfig = true,
            },
        },
        workspace_required = false,
    },
}

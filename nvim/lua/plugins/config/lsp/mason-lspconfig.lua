require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer", -- Rust
        "jdtls", -- Java
        "lua_ls", -- Lua
        "pyright", -- Python
        -- "eslint", -- TypeScript/JavaScript
        "biome", -- TypeScript/JavaScript
        "vtsls", -- TypeScript/JavaScript,
        "html", -- Html
        "cssls", -- CSS
        "sqls", -- SQL
        "bashls", -- Bash
        "jsonls", -- JSON
        "yamlls", -- YAML
        "taplo", -- TOML
    },
    automatic_enable = true,
})



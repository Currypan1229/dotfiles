require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer", -- Rust
        "jdtls", -- Java
        "lua_ls", -- Lua
        "pyright", -- Python
        "ts_ls", -- TypeScript/JavaScript
        -- "eslint", -- TypeScript/JavaScript
        -- "biome",         -- TypeScript/JavaScript
        -- "vtsls",  -- TypeScript/JavaScript,
        "html", -- Html
        "cssls", -- CSS
        "sql-language-server", -- SQL
        "bashls", -- Bash
        "jsonls", -- JSON
        "yamlls", -- YAML
        "taplo", -- TOML
    },
    automatic_enable = true,
})

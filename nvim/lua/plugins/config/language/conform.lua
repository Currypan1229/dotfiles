require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        sql = { "sql_formatter" },
        java = { "google-java-format" },
        rust = { "rustfmt" },
        markdown = { "prettier" },
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
})

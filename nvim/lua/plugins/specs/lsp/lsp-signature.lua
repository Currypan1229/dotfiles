return {
    "ray-x/lsp_signature.nvim",
    event = { "InsertEnter", "BufRead" },
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded"
        }
    },
}

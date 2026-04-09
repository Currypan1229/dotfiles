return {
    "bassamsdata/namu.nvim",
    keys = {
        { "<leader>ss", "<cmd>Namu symbols<cr>",   desc = "Jump to LSP symbol",      silent = true },
        { "<leader>sw", "<cmd>Namu workspace<cr>", desc = "LSP Symbols - Workspace", silent = true },
    },
    opts = {
        global = {},
        namu_symbols = {
            options = {},
        },
    },
}

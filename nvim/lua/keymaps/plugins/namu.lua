local keys = {}

table.insert(keys, {
    "<leader>ss",
    "<cmd>Namu symbols<cr>",
    desc = "Jump to LSP symbol",
    silent = true,
})
table.insert(keys, {
    "<leader>sw",
    "<cmd>Namu workspace<cr>",
    desc = "LSP Symbols - Workspace",
    silent = true,
})

return keys

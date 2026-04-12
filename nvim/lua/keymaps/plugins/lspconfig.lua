local keys = {}

table.insert(keys, {
    "<leader>lr",
    vim.lsp.buf.rename,
    desc = "Rename field",
})
table.insert(keys, {
    "<leader>lsu",
    vim.lsp.buf.references,
    desc = "Show references",
})
table.insert(keys, {
    "<leader>ljd",
    vim.lsp.buf.definition,
    desc = "Jump to definition",
})
table.insert(keys, {
    "<leader>lji",
    vim.lsp.buf.declaration,
    desc = "Jump to declaration",
})
table.insert(keys, {
    "<leader>lje",
    vim.lsp.buf.implementation,
    desc = "Jump to implementation",
})
table.insert(keys, {
    "<leader>ljt",
    vim.lsp.buf.type_definition,
    desc = "Jump to type definition",
})

return keys

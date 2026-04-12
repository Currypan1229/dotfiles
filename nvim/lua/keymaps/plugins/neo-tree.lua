local keys = {}

table.insert(keys, {
    mode = "n",
    "<leader>t",
    "<cmd>Neotree toggle<CR>",
    {},
})
table.insert(keys, {
    mode = "n",
    "<C-m>",
    "<cmd>Neotree reveal<CR>",
    {},
})
table.insert(keys, {
    mode = "n",
    "<leader>b",
    "<cmd>Neotree float buffers<CR>",
    {},
})

return keys

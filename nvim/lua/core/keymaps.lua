local keymap = vim.keymap
local kopts = { noremap = true, silent = true }

keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- keymap.set({"i", "v", "x", "o", "t", "c"}, "<A-Space>", "<esc>")

keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})

keymap.set("n", "zR", [[<Cmd>lua require("ufo").openAllFolds()<CR>]], kopts)
keymap.set("n", "zM", [[<Cmd>lua require("ufo").closeAllFolds()<CR>]], kopts)

keymap.set("n", "<leader>ss", ":Namu symbols<cr>", {
	desc = "Jump to LSP symbol",
	silent = true,
})
keymap.set("n", "<leader>sw", ":Namu workspace<cr>", {
	desc = "LSP Symbols - Workspace",
	silent = true,
})

keymap.set("n", "n", [[<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "N", [[<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "*", [[*<Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "#", [[#<Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "g*", [[g*<Cmd>lua require("hlslens").start()<CR>]], kopts)
keymap.set("n", "g#", [[g#<Cmd>lua require("hlslens").start()<CR>]], kopts)

keymap.set("n", "<Leader>l", "<Cmd>noh<CR>", kopts)

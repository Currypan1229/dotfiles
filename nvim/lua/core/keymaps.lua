local keymap = vim.keymap

keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})

keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})

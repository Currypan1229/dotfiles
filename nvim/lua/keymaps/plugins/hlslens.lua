local keys = {}

table.insert(keys, {
    "n",
    [[<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>]],
    silent = true,
})
table.insert(keys, {
    "N",
    [[<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>]],
    silent = true,
})
table.insert(keys, {
    "*",
    [[*<Cmd>lua require("hlslens").start()<CR>]],
    silent = true,
})
table.insert(keys, {
    "#",
    [[#<Cmd>lua require("hlslens").start()<CR>]],
    silent = true,
})
table.insert(keys, {
    "g*",
    [[g*<Cmd>lua require("hlslens").start()<CR>]],
    silent = true,
})
table.insert(keys, {
    "g#",
    [[g#<Cmd>lua require("hlslens").start()<CR>]],
    silent = true,
})

return keys

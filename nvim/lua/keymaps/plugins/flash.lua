local keys = {}

table.insert(keys, {
    "s",
    mode = { "n", "x", "o" },
    function()
        require("flash").jump()
    end,
    desc = "Flash",
})
table.insert(keys, {
    "S",
    mode = { "n", "x", "o" },
    function()
        require("flash").treesitter()
    end,
    desc = "Flash Treesitter",
})
table.insert(keys, {
    "r",
    mode = "o",
    function()
        require("flash").remote()
    end,
    desc = "Remote Flash",
})
table.insert(keys, {
    "R",
    mode = { "o", "x" },
    function()
        require("flash").treesitter_search()
    end,
    desc = "Treesitter Search",
})
table.insert(keys, {
    "<c-s>",
    mode = { "c" },
    function()
        require("flash").toggle()
    end,
    desc = "Toggle Flash Search",
})
table.insert(keys, {
    "<c-space>",
    mode = { "n", "o", "x" },
    function()
        require("flash").treesitter({
            actions = {
                ["<c-space>"] = "next",
                ["<BS>"] = "prev",
            },
        })
    end,
    desc = "Treesitter Incremental Selection",
})

return keys

local keys = {}

table.insert(keys, {
    "<leader>st",
    function()
        Snacks.picker.todo_comments()
    end,
    desc = "Todo",
})
table.insert(keys, {
    "<leader>sT",
    function()
        Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
    end,
    desc = "Todo/Fix/Fixme",
})

return keys

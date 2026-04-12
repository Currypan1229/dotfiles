local keys = {}

table.insert(keys, {
    "[c",
    function()
        require("treesitter-context").go_to_context(vim.v.count1)
    end,
})

return keys

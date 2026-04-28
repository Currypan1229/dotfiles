local keys = {}

table.insert(keys, {
    "<leader>ota",
    "<cmd>ToggleTerm<cr>",
    desc = "Toggle Terminal",
    silent = true,
})
table.insert(keys, {
    "<leader>ott",
    function()
        Snacks.picker.buffers({
            filter = {
                filter = function(item)
                    Snacks.notify.notify(vim.bo[item.buf].buftype, {})
                    return vim.bo[item.buf].buftype == "terminal"
                end,
            },
            nofile = true,
        })
    end,
    desc = "Open New Terminal",
    silent = true,
})
table.insert(keys, {
    "<leader>otn",
    function()
        local term = require("toggleterm.terminal").Terminal

        local term_win = term:new()
        term_win:toggle()
    end,
    desc = "Open New Terminal",
    silent = true,
})

return keys

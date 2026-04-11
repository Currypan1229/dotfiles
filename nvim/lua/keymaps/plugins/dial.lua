local keys = {}

-- Normal mode
table.insert(keys, {
    "<C-a>",
    function()
        require("dial.map").manipulate("increment", "normal")
    end,
    mode = "n",
    desc = "Increment",
})
table.insert(keys, {
    "<C-x>",
    function()
        require("dial.map").manipulate("decrement", "normal")
    end,
    mode = "n",
    desc = "Decrement",
})
table.insert(keys, {
    "g<C-a>",
    function()
        require("dial.map").manipulate("increment", "gnormal")
    end,
    mode = "n",
    desc = "G-Increment",
})
table.insert(keys, {
    "g<C-x>",
    function()
        require("dial.map").manipulate("decrement", "gnormal")
    end,
    mode = "n",
    desc = "G-Decrement",
})
-- Visual mode
table.insert(keys, {
    "<C-a>",
    function()
        require("dial.map").manipulate("increment", "visual")
    end,
    mode = "x",
    desc = "Visual Increment",
})
table.insert(keys, {
    "<C-x>",
    function()
        require("dial.map").manipulate("decrement", "visual")
    end,
    mode = "x",
    desc = "Visual Decrement",
})
table.insert(keys, {
    "g<C-a>",
    function()
        require("dial.map").manipulate("increment", "gvisual")
    end,
    mode = "x",
    desc = "Visual G-Increment",
})
table.insert(keys, {
    "g<C-x>",
    function()
        require("dial.map").manipulate("decrement", "gvisual")
    end,
    mode = "x",
    desc = "Visual G-Decrement",
})

return keys

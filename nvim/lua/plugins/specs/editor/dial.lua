return {
    "monaqa/dial.nvim",
    keys = {
        -- Normal mode
        {
            "<C-a>",
            function()
                require("dial.map").manipulate("increment", "normal")
            end,
            mode = "n",
            desc = "Increment",
        },
        {
            "<C-x>",
            function()
                require("dial.map").manipulate("decrement", "normal")
            end,
            mode = "n",
            desc = "Decrement",
        },
        {
            "g<C-a>",
            function()
                require("dial.map").manipulate("increment", "gnormal")
            end,
            mode = "n",
            desc = "G-Increment",
        },
        {
            "g<C-x>",
            function()
                require("dial.map").manipulate("decrement", "gnormal")
            end,
            mode = "n",
            desc = "G-Decrement",
        },
        -- Visual mode
        {
            "<C-a>",
            function()
                require("dial.map").manipulate("increment", "visual")
            end,
            mode = "x",
            desc = "Visual Increment",
        },
        {
            "<C-x>",
            function()
                require("dial.map").manipulate("decrement", "visual")
            end,
            mode = "x",
            desc = "Visual Decrement",
        },
        {
            "g<C-a>",
            function()
                require("dial.map").manipulate("increment", "gvisual")
            end,
            mode = "x",
            desc = "Visual G-Increment",
        },
        {
            "g<C-x>",
            function()
                require("dial.map").manipulate("decrement", "gvisual")
            end,
            mode = "x",
            desc = "Visual G-Decrement",
        },
    },
}

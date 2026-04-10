return {
    "folke/todo-comments.nvim",
    dependencies = {
        "folke/flash.nvim",
        "nvim-lua/plenary.nvim",
    },
    event = { "VeryLazy" },
    ---@type snacks.Config
    keys = {
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "Todo",
        },
        {
            "<leader>sT",
            function()
                Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
            end,
            desc = "Todo/Fix/Fixme",
        },
    },
}

return {
    "folke/todo-comments.nvim",
    dependencies = {
        "folke/flash.nvim",
        "nvim-lua/plenary.nvim",
    },
    event = { "VeryLazy" },
    ---@type snacks.Config
    keys = require("keymaps.plugins.todo-comments"),
}

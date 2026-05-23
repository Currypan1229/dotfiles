return {
    "folke/trouble.nvim",
    opts = {
        win = {
            position = "right",
            size = 0.3,
        },
    },
    cmd = "Trouble",
    specs = {
        "Currypan1229/snacks.nvim",
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts or {}, {
                picker = {
                    actions = require("trouble.sources.snacks").actions,
                    win = {
                        input = {
                            keys = {
                                ["<c-t>"] = {
                                    "trouble_open",
                                    mode = { "n", "i" },
                                },
                            },
                        },
                    },
                },
            })
        end,
    },
    keys = require("keymaps.plugins.trouble"),
}

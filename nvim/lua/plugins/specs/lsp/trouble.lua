return {
    "folke/trouble.nvim",
    opts = {
        modes = {
            lsp = {
                win = { position = "right" },
            },
        },
    },
    cmd = "Trouble",
    specs = {
        "folke/snacks.nvim",
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

return {
    "lewis6991/gitsigns.nvim",
    event = { "VeryLazy" },
    keys = {
        -- Navigation
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    require("gitsigns").nav_hunk("next")
                end
            end,
            desc = "Next Hunk"
        },
        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    require("gitsigns").nav_hunk("prev")
                end
            end,
            desc = "Prev Hunk"
        },

        -- Actions
        { "<leader>hs", ":Gitsigns stage_hunk<CR>",                       mode = { "n", "v" },         desc = "Stage Hunk" },
        { "<leader>hr", ":Gitsigns reset_hunk<CR>",                       mode = { "n", "v" },         desc = "Reset Hunk" },
        { "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>",                 desc = "Stage Buffer" },
        { "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>",                 desc = "Reset Buffer" },
        { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>",                 desc = "Preview Hunk" },
        { "<leader>hi", "<cmd>Gitsigns preview_hunk_inline<cr>",          desc = "Preview Hunk Inline" },
        { "<leader>hb", "<cmd>Gitsigns blame_line full=true<cr>",         desc = "Blame Line (Full)" },
        { "<leader>hd", "<cmd>Gitsigns diffthis<cr>",                     desc = "Diff This" },
        { "<leader>hD", function() require("gitsigns").diffthis("~") end, desc = "Diff This (~)" },
        { "<leader>hQ", "<cmd>Gitsigns setqflist all<cr>",                desc = "Set QF List (All)" },
        { "<leader>hq", "<cmd>Gitsigns setqflist<cr>",                    desc = "Set QF List" },

        -- Toggles
        { "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>",    desc = "Toggle Blame Line" },
        { "<leader>tw", "<cmd>Gitsigns toggle_word_diff<cr>",             desc = "Toggle Word Diff" },

        -- Text object
        { "ih",         ":<C-U>Gitsigns select_hunk<CR>",                 mode = { "o", "x" },         desc = "Select Hunk" },
    },
}

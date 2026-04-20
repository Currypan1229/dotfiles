require("edgy").setup({
    bottom = {
        {
            ft = "toggleterm",
            filter = function(buf, win)
                return vim.api.nvim_win_get_config(win).relative == ""
            end,
        },
        "Trouble",
    },
    left = {
        -- Neo-tree filesystem always takes half the screen height
        {
            title = "Neo-Tree",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
            end,
            pinned = true,
            collapsed = false,
        },
        {
            title = "Neo-Tree Git",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "git_status"
            end,
            pinned = true,
            open = "Neotree position=right git_status",
        },
        {
            title = "Neo-Tree Buffers",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
            end,
            pinned = true,
            collapsed = true, -- show window as closed/collapsed on start
            open = "Neotree position=top buffers",
        },
        {
            title = function()
                local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
                return "Symbols: " .. vim.fn.fnamemodify(buf_name, ":t")
            end,
            ft = "aerial",
            pinned = true,
            open = "AerialToggle",
        },
    },

    animate = {
        enabled = false,
    },
})

return {
    "andymass/vim-matchup",
    init = function()
        vim.g.matchup_treesitter_stopline = 500

        require("match-up").setup({
            treesitter = {
                stopline = 500
            }
        })
    end,
    -- or use the `opts` mechanism built into `lazy.nvim`. It calls
    -- `require("match-up").setup` under the hood
    ---@type matchup.Config
    opts = {
        treesitter = {
            stopline = 500,
        }
    }
}

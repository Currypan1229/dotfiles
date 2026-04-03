return {
    "nvim-treesitter/nvim-treesitter-context",
    keys = {
        { "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end }
    },
    config = function()
        require("plugins.config.treesitter.treesitter-context")
    end,
}

return {
    "nvim-treesitter/nvim-treesitter-context",
    keys = require("keymaps.plugins.treesitter-context"),
    config = function()
        require("plugins.config.treesitter.treesitter-context")
    end,
}

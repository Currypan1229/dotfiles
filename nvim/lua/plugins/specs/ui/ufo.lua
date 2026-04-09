return {
    "kevinhwang91/nvim-ufo",
    dependencies = { { "kevinhwang91/promise-async", lazy = true } },
    keys = {
        { "zR", function() require("ufo").openAllFolds() end,  desc = "Open all folds" },
        { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    },
    config = function()
        require("plugins.config.ui.ufo")
    end,
}

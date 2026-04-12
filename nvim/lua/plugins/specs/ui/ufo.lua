return {
    "kevinhwang91/nvim-ufo",
    dependencies = { { "kevinhwang91/promise-async", lazy = true } },
    keys = require("keymaps.plugins.ufo"),
    config = function()
        require("plugins.config.ui.ufo")
    end,
}

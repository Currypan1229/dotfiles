return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "VeryLazy" },
    dependencies = {
        "mason-org/mason.nvim",
    },
    config = function()
        require("plugins.config.lsp.mason-tool-installer")
    end,
}

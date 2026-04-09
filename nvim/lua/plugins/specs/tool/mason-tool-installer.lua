return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "VeryLazy" },
    dependencies = {
        "mason-org/mason.nvim",
    },
    config = function()
        require("plugins.config.tool.mason-tool-installer")
    end,
}

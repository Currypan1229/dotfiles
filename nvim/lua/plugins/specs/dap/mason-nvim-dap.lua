return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "mfussenegger/nvim-dap",
    },
    config = function()
        require("plugins.config.dap.mason-nvim-dap")
    end,
}

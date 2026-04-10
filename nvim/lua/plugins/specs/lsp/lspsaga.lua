return {
    "nvimdev/lspsaga.nvim",
    event = { "LspAttach" },
    config = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons",     -- optional
    },
}

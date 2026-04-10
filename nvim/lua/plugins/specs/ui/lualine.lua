return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                },
            },
        })
    end,
}

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/neoconf.nvim", lazy = true, opts = {} },
    },
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspStart" },
}

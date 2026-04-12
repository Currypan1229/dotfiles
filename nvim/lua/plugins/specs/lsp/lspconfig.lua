return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/neoconf.nvim", lazy = true, opts = {} },
    },
    event = { "BufReadPre", "BufNewFile" },
    keys = require("keymaps.plugins.lspconfig"),
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    config = function ()
        require("plugins.config.lsp.lspconfig")
    end
}

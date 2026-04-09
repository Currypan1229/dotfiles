return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/neoconf.nvim", lazy = true, opts = {} },
    },
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<leader>lr",  vim.lsp.buf.rename,          desc = "Rename field" },
        { "<leader>lsu", vim.lsp.buf.references,      desc = "Show references" },
        { "<leader>ljd", vim.lsp.buf.definition,      desc = "Jump to definition" },
        { "<leader>lji", vim.lsp.buf.declaration,     desc = "Jump to declaration" },
        { "<leader>lje", vim.lsp.buf.implementation,  desc = "Jump to implementation" },
        { "<leader>ljt", vim.lsp.buf.type_definition, desc = "Jump to type definition" },
    },
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    config = function ()
        require("plugins.config.lsp.lspconfig")
    end
}

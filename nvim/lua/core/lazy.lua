local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.editorconfig = true

vim.o.encoding = "utf-8"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

vim.scriptencoding = "utf-8"

vim.diagnostic.config({
    virtual_text = true,
    underline = true
})

require("lazy").setup({
    spec = {
        { import = "plugins.specs.cmp" },
        { import = "plugins.specs.coding" },
        { import = "plugins.specs.editor" },
        { import = "plugins.specs.git" },
        { import = "plugins.specs.language" },
        { import = "plugins.specs.lsp" },
        { import = "plugins.specs.treesitter" },
        { import = "plugins.specs.ui" },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})

vim.cmd.colorscheme("catppuccin")

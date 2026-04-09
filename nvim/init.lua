require("core.profile")

vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.editorconfig = true

vim.o.encoding = "utf-8"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.scriptencoding = "utf-8"

require("core.lazy")

require("core.autocmds")
require("core.options")
require("core.usercmds")
require("keymaps.init")

require("core.profile")

vim.loader.enable()

vim.g.mapleader = " "
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"

require("core.lazy")

require("core.autocmds")
require("core.options")
require("core.usercmds")
require("keymaps.init")

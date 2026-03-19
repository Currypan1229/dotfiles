require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	indent = { enable = true },
	highlight = { enable = true },
	folds = { enable = true },
	ensure_installed = "all",
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
		},
		cmd = {
			"TSBufDisable",
			"TSBufEnable",
			"TSBufToggle",
			"TSDisable",
			"TSEnable",
			"TSToggle",
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSModuleInfo",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
		},
		build = {
			":TSUpdate",
		},
		config = function()
			require("plugins.config.treesitter.treesitter")
		end,
	},
	{
		"monaqa/tree-sitter-unifieddiff",
		build = function(opts)
			local output = vim.fs.joinpath(parser_path, "unifieddiff.so")
			vim.system({ "tree-sitter", "build", "--output", output }, { cwd = opts.dir }, function() end)
		end,
	},
}

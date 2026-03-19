return {
	"monaqa/tree-sitter-unifieddiff",
	build = function(opts)
		local output = vim.fs.joinpath(parser_path, "unifieddiff.so")
		vim.system({ "tree-sitter", "build", "--output", output }, { cwd = opts.dir }, function() end)
	end,
}

return {
	"kevinhwang91/nvim-ufo",
	dependencies = { { "kevinhwang91/promise-async", lazy = true } },
	config = function()
		require("plugins.config.ui.ufo")
	end,
}

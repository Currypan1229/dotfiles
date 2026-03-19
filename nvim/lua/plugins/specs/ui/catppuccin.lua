return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = true,
	config = function()
		require("plugins.config.ui.cappuccin")
	end,
}

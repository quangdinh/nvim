local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local tokyo = require("tokyonight")
		local opts = {
			style = "night",
			transparent = true,
		}
		tokyo.setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}

return M

local M = {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		local onedark = require("onedarkpro")
		onedark.setup({
			style = "dark",
			highlights = {
				-- NeoTreeNormal = { bg = "#090b0c" },
				-- NeoTreeNormalNC = { bg = "#090b0c" },
			},

			colors = {
				bg = "#1d1f21",
				bg_light = "#121416",
				bg_lighter = "#31373c",
				fg = "#cfd2d0",
				red = "#d77b79",
				orange = "#de935f",
				yellow = "#d19a66",
				green = "#f3cf86",
				cyan = "#c1c67a",
				blue = "#9ac8c3",
				purple = "#92b1c9",
				white = "#fffefe",
				black = "#373b41",
				gray = "#969896",
				highlight = "#373b41",
				comment = "#969896",
				none = "NONE",
				cursorline = "#26272b", -- This is optional. The default cursorline color is based on the background
			},
			options = { cursorline = true, transparency = true },
			styles = {
				types = "NONE",
				methods = "NONE",
				numbers = "NONE",
				strings = "NONE",
				comments = "italic",
				keywords = "bold,italic",
				constants = "NONE",
				functions = "italic",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "italic",
				virtual_text = "NONE",
			},
			plugins = { neo_tree = true },
		})
		vim.cmd("colorscheme onedark")
	end,
}

return M

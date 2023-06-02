local M = {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		local onedark = require("onedarkpro")
		onedark.setup({
			colors = {
        bg = "#191919",
        bg_light = "#26292c",
				bg_lighter = "#26292c",
				fg = "#cfd2d0",
				red = "#d77b79",
				orange = "#d19a66",
				yellow = "#f3cf86",
				green = "#c1c67a",
				cyan = "#9ac8c3",
				blue = "#92b1c9",
				purple = "#c0a6c7",
				white = "#fffefe",
				black = "#060606",
				gray = "#434852",
				highlight = "#e2be7d",
				comment = "#7f848e",
				none = "NONE",
				cursorline = "#26292c", -- This is optional. The default cursorline color is based on the background
			},
			options = {
				cursorline = true,
			},
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
		})
    vim.cmd("colorscheme onedark")
	end,
}

return M

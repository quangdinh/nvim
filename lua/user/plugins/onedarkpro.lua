local M = {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		local opts = {
			style = "dark",
			colors = {
				bg = "#1d1f21",
				bg_light = "#121416",
				bg_lighter = "#31373c",
				fg = "#f7f4f1",
				red = "#d77b79",
				orange = "#de935f",
				yellow = "#f3cf86",
				green = "#c1c67a",
				cyan = "#9ac8c3",
				blue = "#92b1c9",
				purple = "#c0a6c7",
				white = "#fef6ec",
				black = "#121212",
				gray = "#7f858b",
				highlight = "#677983",
				comment = "#7f858b",
				none = "NONE",
				cursorline = "#26272b",
			},
			options = { cursorline = true, transparency = true },
			styles = {
				types = "NONE",
				methods = "NONE",
				numbers = "NONE",
				strings = "NONE",
				comments = "italic",
				keywords = "bold,italic",
				constants = "bold",
				functions = "italic",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "italic",
				virtual_text = "NONE",
			},
			plugins = { neo_tree = true },
		}
    local onedark = require("onedarkpro")
    onedark.setup(opts)
    vim.cmd("colorscheme onedark")
	end,
}

return M

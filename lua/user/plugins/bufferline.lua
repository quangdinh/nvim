local M = {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	tag = "v4.0.0",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				-- mode = "tabs",
				close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				offsets = { { filetype = "neo-tree", text = "Explorer" } },
				separator_style = "none", -- | "thick" | "thin" | { 'any', 'any' },
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and "  " or (e == "warning" and "  " or " 󰋽 ")
						s = s .. n .. sym
					end
					return s
				end,
			},
		})
	end,
}

return M

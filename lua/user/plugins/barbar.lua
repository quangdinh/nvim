local M = {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		icons = {
			button = "",
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = true },
			},
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
			filetype = {
				enabled = true,
			},
			separator = { left = "▎", right = "" },

			separator_at_end = true,

			modified = { button = "●" },
			pinned = { button = "", filename = true },
		},
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWipeout" },
		},
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}

return M

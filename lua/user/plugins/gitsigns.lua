local M = {
	"lewiss6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()
	end,
}

return M

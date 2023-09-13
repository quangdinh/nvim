local M = {
	"ggandor/leap.nvim",
	event = { "BufEnter" },
	config = function()
		local leap = require("leap")
		leap.add_default_mappings()
	end,
}
return M

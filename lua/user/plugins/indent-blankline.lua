local M = {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup({
			show_current_context = true,
			show_current_context_start = false,
      show_end_of_line = true,
		})
	end,
}

return M

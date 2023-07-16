local M = {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })
		function _LAZYDOCKER_TOGGLE()
			lazydocker:toggle()
		end

		local bottom = Terminal:new({ cmd = "btm", hidden = true, direction = "float" })
		function _BOTTOM_TOGGLE()
			bottom:toggle()
		end

		local k9s = Terminal:new({ cmd = "k9s", hidden = true, direction = "float" })
		function _K9S_TOGGLE()
			k9s:toggle()
		end

		local todo = Terminal:new({ cmd = "nvim ~/OneDrive/Notes/Todo.md", hidden = true, direction = "float" })
		function _TODO_TOGGLE()
			todo:toggle()
		end
	end,
}
return M

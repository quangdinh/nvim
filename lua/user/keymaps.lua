-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "

-- Remap space as leader key
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Registers
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)

-- LSP
keymap("n", "gD", vim.lsp.buf.declaration, opts)
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "gi", vim.lsp.buf.implementation, opts)
keymap("n", "<leader>ln", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
keymap("n", "<leader>k", vim.lsp.buf.signature_help, opts)
keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
keymap("n", "<leader>wl", function()
	vim.inspect(vim.lsp.buf.list_workspace_folders())
end, opts)
keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- Neotest
keymap("n", "<leader>ta", "<cmd>Neotest attach<CR>", opts)
keymap("n", "<leader>to", "<cmd>Neotest output<CR>", opts)
keymap("n", "<leader>tp", "<cmd>Neotest output-panel<CR>", opts)
keymap("n", "<leader>tr", "<cmd>Neotest run<CR>", opts)
keymap("n", "<leader>ts", "<cmd>Neotest summary<CR>", opts)
keymap("n", "<leader>tx", "<cmd>Neotest stop<CR>", opts)
keymap("n", "<leader>tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)

-- Coverage
keymap("n", "<leader>cl", "<cmd>CoverageLoad<CR><cmd>CoverageShow<CR>", opts)
keymap("n", "<leader>cs", "<cmd>CoverageSummary<CR>", opts)

-- Noice
keymap("n", "<leader>nh", "<cmd>NoiceHistory<CR>", opts)
keymap("n", "<leader>nl", "<cmd>NoiceLast<CR>", opts)
keymap("n", "<leader>ne", "<cmd>NoiceErrors<CR>", opts)

-- Delete buffer --
keymap("n", "<C-q>", "<cmd>lua Snacks.bufdelete()<CR>", opts)

keymap("n", "<leader>lf", ":Neoformat<CR>", opts)
-- Lazy UI
keymap("n", "<leader>lz", ":Lazy<CR>", opts)

-- Mason UI
keymap("n", "<leader>ms", ":Mason<CR>", opts)

-- Resizing panes
keymap("n", "<leader>wj", ":resize -2<CR>", opts)
keymap("n", "<leader>wk", ":resize +2<CR>", opts)
keymap("n", "<leader>wh", ":vertical resize -5<CR>", opts)
keymap("n", "<leader>wl", ":vertical resize +5<CR>", opts)

-- Move text up and down
keymap("n", "<C-j>", ":m .+1<CR>==", opts)
keymap("n", "<C-k>", ":m .-2<CR>==", opts)

keymap("v", "<C-j>", ":m'>+<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m -2<CR>gv=gv", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Undo with capital U
keymap("n", "U", ":redo<CR>")

-- Insert --
-- Press iu fast to enter
keymap({ "i" }, "iu", "<ESC>", opts)
keymap({ "v" }, "iu", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

keymap("n", "<leader>ca", "<cmd>lua require('tiny-code-action').code_action()<CR>", opts)
-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Terminals
keymap("n", "<leader>dd", "<cmd>lua _LAZYDOCKER_TOGGLE()<CR>", opts)
keymap("n", "<leader>kk", "<cmd>lua _K9S_TOGGLE()<CR>", opts)
keymap("n", "<leader>td", "<cmd>lua _TODO_TOGGLE()<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- -- LSP Diagnostic with Trouble
-- keymap("n", "<leader>xx", "<cmd>Trouble workspace_diagnostics<cr>", opts)
-- keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
-- keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
-- keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
-- keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", opts)

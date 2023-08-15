-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "

--Remap space as leader key
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten toggle_todo<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Delete buffer --
keymap("n", "<C-q>", ":Bdelete<CR>", opts)

-- Line numbers
keymap("n", "<leader>ll", "<cmd>lua toggle_linenumbers()<CR>", opts)

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
keymap("v", "<C-j>", ":m -2<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m'>+<CR>gv=gv", opts)


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
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Terminals
keymap("n", "<leader>t", ":ToggleTerm<CR>", opts)
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>dd", "<cmd>lua _LAZYDOCKER_TOGGLE()<CR>", opts)
keymap("n", "<leader>bb", "<cmd>lua _BOTTOM_TOGGLE()<CR>", opts)
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

-- LSP Diagnostic with Trouble
keymap("n", "<leader>xx", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", opts)

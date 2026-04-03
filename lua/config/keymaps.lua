-- Shorten function name
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "

-- Buffer management
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Window management
-- Window splitting
keymap("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
keymap("n", "<leader>ws", "<C-W>s", { desc = "Split window horizontally" })
keymap("n", "<leader>wv", "<C-W>v", { desc = "Split window vertically" })
keymap("n", "<leader>wq", "<C-W>c", { desc = "Close window" })

-- Resizing panes
keymap("n", "<leader>wj", ":resize -2<CR>", opts)
keymap("n", "<leader>wk", ":resize +2<CR>", opts)
keymap("n", "<leader>wh", ":vertical resize -5<CR>", opts)
keymap("n", "<leader>wl", ":vertical resize +5<CR>", opts)

-- Searching
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Clipboard
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
--keymap("n", "<C-j>", ":m .+1<CR>==", opts)
--keymap("n", "<C-k>", ":m .-2<CR>==", opts)

--keymap("v", "<C-j>", ":m'>+<CR>gv=gv", opts)
--keymap("v", "<C-k>", ":m -2<CR>gv=gv", opts)

-- Move Lines
keymap("n", "<C-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down", silent = true })
keymap("n", "<C-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up", silent = true })
keymap("v", "<C-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down", silent = true })
keymap("v", "<C-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up", silent = true })

-- Goto
keymap("n", "gl", "$", { desc = "Go to end of line" })
keymap("n", "gh", "^", { desc = "Go to start of line" })

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

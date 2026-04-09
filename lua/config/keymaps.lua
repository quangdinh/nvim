-- Shorten function name
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function descOpts(desc)
  return { desc = desc, noremap = true, silent = true }
end

-- Leader key
keymap("", " ", "<Nop>", opts)
vim.g.mapleader = " "

-- Buffer management
keymap("n", "<leader>bb", "<cmd>e #<CR>", descOpts("Switch to Other Buffer"))
keymap("n", "<leader>bn", ":enew<CR>", descOpts("New buffer"))

keymap("n", "<S-l>", ":bnext<CR>", descOpts("Next buffer"))
keymap("n", "<S-h>", ":bprevious<CR>", descOpts("Previous buffer"))

-- Toggles
keymap("n", "<leader>ll", ':lua Toggle("relativenumber")<CR>', descOpts("Toggle relative line numbers"))
keymap("n", "<leader>tw", ':lua Toggle("wrap")<CR>', descOpts("Toggle line wrap"))

-- Formatting
keymap("v", "<leader>fj", ":!jq .<CR>", descOpts("Format selection with JSON"))

-- Window management
-- Window splitting
keymap("n", "<leader>ww", "<C-W>p", descOpts("Other window"))
keymap("n", "<leader>ws", "<C-W>s", descOpts("Split window horizontally"))
keymap("n", "<leader>wv", "<C-W>v", descOpts("Split window vertically"))
keymap("n", "<leader>wq", "<C-W>c", descOpts("Close window"))

-- Resizing panes
keymap("n", "<leader>wj", ":resize -2<CR>", descOpts("Resize window down"))
keymap("n", "<leader>wk", ":resize +2<CR>", descOpts("Resize window up"))
keymap("n", "<leader>wh", ":vertical resize -5<CR>", descOpts("Resize window left"))
keymap("n", "<leader>wl", ":vertical resize +5<CR>", descOpts("Resize window right"))

-- Searching
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", descOpts("Clear search highlights"))

-- Clipboard
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("v", "p", '"_dP', opts)

-- Move Lines
keymap("n", "<C-j>", "<cmd>execute 'move .+' . v:count1<CR>==", descOpts("Move Down"))
keymap("n", "<C-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", descOpts("Move Up"))
keymap("v", "<C-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", descOpts("Move Down"))
keymap("v", "<C-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", descOpts("Move Up"))

-- Navigation in insert mode
keymap("i", "<A-h>", "<Left>", descOpts("Move cursor left"))
keymap("i", "<A-l>", "<Right>", descOpts("Move cursor right"))
keymap("i", "<A-j>", "<Down>", descOpts("Move cursor down"))
keymap("i", "<A-k>", "<Up>", descOpts("Move cursor up"))

-- Goto
keymap("n", "gl", "$", descOpts("Go to end of line"))
keymap("n", "gh", "^", descOpts("Go to start of line"))

-- Undo with capital U
keymap("n", "U", ":redo<CR>", descOpts("Redo"))

-- Insert --
-- Press iu fast to enter
keymap({ "i" }, "iu", "<ESC>", descOpts("Exit insert mode"))
keymap({ "v" }, "iu", "<ESC>", descOpts("Exit visual mode"))

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", descOpts("Indent left and stay in visual mode"))
keymap("v", ">", ">gv", descOpts("Indent right and stay in visual mode"))

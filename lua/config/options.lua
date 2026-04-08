local opt = vim.opt
local undodir = vim.fn.expand("~/.vim/undodir")

-- Create undo directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- General
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.hidden = true
opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.autochdir = false
opt.iskeyword:append("-")
opt.path:append("**")
opt.selection = "exclusive"
opt.mouse = "a"
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.modifiable = true
opt.formatoptions = "jcrqlnt" -- tcqj

-- GUI
vim.opt.guifont = "MonoLisa Nerd Font:h14"
vim.g.neovide_input_macos_option_key_is_meta = true
vim.g.neovide_opacity = 0.9
vim.opt.termguicolors = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Visual settings
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 0
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 1
opt.confirm = false
opt.concealcursor = ""
opt.synmaxcol = 300
opt.ruler = false
opt.virtualedit = "block"
opt.winminwidth = 5
opt.numberwidth = 3

-- Buffer and file settings
opt.encoding = "UTF-8"
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = undodir
opt.updatetime = 300
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = true

-- Folding settings
opt.smoothscroll = true
vim.wo.foldmethod = "expr"
opt.foldlevel = 99 -- Start with all folds open

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Split behavior
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen"

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
opt.diffopt:append("linematch:60")

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

opt.jumpoptions = "view"
opt.laststatus = 3
opt.list = false
opt.linebreak = true
opt.shiftround = true
opt.shortmess:append({ W = true, I = true, c = true, C = true })

vim.g.markdown_recommended_style = 0

vim.filetype.add({
  extension = {
    env = "dotenv",
    http = "http",
    rest = "http",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})

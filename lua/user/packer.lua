local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "moll/vim-bbye" }

  -- snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- Comments
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }

  -- Colorschemes
  use { "RRethy/nvim-base16" }
  
  -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }
  use { "folke/trouble.nvim" }

  -- Toggle term with <C-\>
  use { "akinsho/toggleterm.nvim" }
  
  -- Show indentation for blank lines
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Icons
  use { "kyazdani42/nvim-web-devicons" }

  -- File tree
  use { "kyazdani42/nvim-tree.lua" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" }

  -- Git: show git information
  use { "lewis6991/gitsigns.nvim" }

  -- Tab bar
  use { "akinsho/bufferline.nvim" }

  -- Autopair: automatically insert closing character
  use { "windwp/nvim-autopairs" }
  
  -- Telescope: fuzzy finder
  use { "nvim-telescope/telescope.nvim" }

  -- Project management
  use { "ahmedkhalf/project.nvim" }

  -- Symbols outline
  use { "simrat39/symbols-outline.nvim" }

  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui" }
  use { "ravenxrz/DAPInstall.nvim" }

  -- Status bar
  use { "nvim-lualine/lualine.nvim" }

  -- Provide code context in winbar
  use { "SmiteshP/nvim-navic" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

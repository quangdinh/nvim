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
  use { "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "46e8bb9d3a852e0a2678be2d48179db545a9a39a" } -- Useful lua functions used by lots of plugins
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "7d78278c2a935b8cd1b6b43065223e14490f3133" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "24afb4c178d8ea28bfa73f37814ada43be478b1d" } -- a bunch of snippets to use

  -- Comments
  use { "numToStr/Comment.nvim", commit = "4086630ce2aaf76b2652516ee3169f0b558f6be1" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }

  -- Colorschemes
  use({ "RRethy/nvim-base16", commit = "da2a27cbda9b086c201b36778e7cdfd00966627a" })
  
  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "9897465a7663997b7b42372164ffc3635321a2fe" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "41a826947eefbc7b59cc80cef405cce9ea6d82b8" } -- enable LSP
  use { "williamboman/nvim-lsp-installer", commit = "33700e2de88699caa064e94e9642f244b26ac014" } -- simple to use language server installer
  use { "jose-elias-alvarez/null-ls.nvim", commit = "fbb1929b29beff82e0fc495670f00ef4b3bcbcd3" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "6bfa5dc069bd4aa8513a3640d0b73392094749be" }
  use { "folke/trouble.nvim" }

  -- Toggle term with <C-\>
  use { "akinsho/toggleterm.nvim", commit = "8cba5c20c9d8517af21ac9e2afd06ad7b2dbdece" }
  
  -- Show indentation for blank lines
  use { "lukas-reineke/indent-blankline.nvim", commit = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025" }

  -- Icons
  use { "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }

  -- File tree
  use { "kyazdani42/nvim-tree.lua", commit = "831f1158c3bf91052453b09b84663db43584edea" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "2f340af1357b0bae96b70b8969669000c5e6fe46" }

  -- Git: show git information
  use { "lewis6991/gitsigns.nvim", commit = "bb6c3bf6f584e73945a0913bb3adf77b60d6f6a2" }

  -- Tab bar
  use { "akinsho/bufferline.nvim", commit = "b5a2b1f66b61df620f92cd3ad13f6d8aa7cda08c" }

  -- Autopair: automatically insert closing character
  use { "windwp/nvim-autopairs", commit = "972a7977e759733dd6721af7bcda7a67e40c010e" }
  
  -- Telescope: fuzzy finder
  use { "nvim-telescope/telescope.nvim", commit = "524c4eb7fb1a9941460ab7c7c09a3bca9cebb7be" }

  -- Project management
  use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }

  -- Symbols outline
  use { "simrat39/symbols-outline.nvim", commit = "15ae99c27360ab42e931be127d130611375307d5" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "f4a3be57f61893cffa1e22aa5e1e7bded495fcf2" }
  use { "rcarriga/nvim-dap-ui", commit = "d33b905770f9c674468b0b83bed3aeab41cf9bb0" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Status bar
  use { "nvim-lualine/lualine.nvim", commit = "c15e3b4c9eb7015dd58688b3d9bb1d659a49d3d1" }

  -- Provide code context in winbar
  use { "SmiteshP/nvim-navic", commit = "f0a354225570521bace3244d2bce91fdb484d4cd" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

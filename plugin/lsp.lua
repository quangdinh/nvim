vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig", load = false },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = augroup("lspconfig"),
  once = true,
  pattern = "*",
  callback = function()
    vim.cmd.packadd("nvim-lspconfig")
    vim.lsp.enable({
      "lua_ls",
      "golangci_lint_ls",
      "gopls",
      "pyright",
      "html",
      "cssls",
      "vtsls",
      "jqls",
      "yamlls",
      "docker_compose_language_service",
      "docker_language_server",
    })
  end,
})


vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})

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

vim.pack.add({
  "https://github.com/mistweaverco/kulala.nvim",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("KulalaHTTP"),
  pattern = "http",
  callback = function()
    local opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>k",
      kulala_keymaps_prefix = "",
      lsp = { formatter = true },
    }

    require("kulala").setup(opts)
  end,
})

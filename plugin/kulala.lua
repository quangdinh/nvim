vim.pack.add({
  { src = "https://github.com/mistweaverco/kulala.nvim", load = false },
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("KulalaHTTP"),
  pattern = "http",
  once = true,
  callback = function()
    vim.cmd.packadd("kulala.nvim")
    local opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>k",
      kulala_keymaps_prefix = "",
      lsp = { formatter = true },
    }

    require("kulala").setup(opts)
  end,
})

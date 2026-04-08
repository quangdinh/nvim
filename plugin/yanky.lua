vim.pack.add({
  { src = "https://github.com/gbprod/yanky.nvim", load = false },
})

vim.api.nvim_create_autocmd("BufRead", {
  group = augroup("yanky"),
  pattern = "*",
  once = true,
  callback = function()
    vim.cmd.packadd("yanky.nvim")

    require("yanky").setup({
      highlight = {
        timer = 150,
      },
    })
  end,
})

-- Keymaps
vim.keymap.set({ "n", "x" }, "<leader>p", function()
  require("snacks").picker.yanky()
end, { desc = "Yank History" })

vim.keymap.set({ "n", "x" }, "y", function()
  return "<Plug>(YankyYank)"
end, { desc = "Yank", expr = true })

vim.keymap.set({ "n", "x" }, "p", function()
  return "<Plug>(YankyPutAfter)"
end, { desc = "Paste after", expr = true })

vim.keymap.set({ "n", "x" }, "P", function()
  return "<Plug>(YankyPutBefore)"
end, { desc = "Paste before", expr = true })

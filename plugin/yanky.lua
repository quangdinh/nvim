vim.pack.add({
  { src = "https://github.com/gbprod/yanky.nvim", load = false },
})

local _yanky_loaded = false

local function load_yanky()
  if _yanky_loaded then
    return
  end
  vim.cmd.packadd("yanky.nvim")
  _yanky_loaded = true

  require("yanky").setup({
    highlight = {
      timer = 150,
    },
  })
end

-- Keymaps
vim.keymap.set({ "n", "x" }, "<leader>p", function()
  load_yanky(); require("snacks").picker.yanky()
end, { desc = "Yank History" })

vim.keymap.set({ "n", "x" }, "y", function()
  load_yanky(); return "<Plug>(YankyYank)"
end, { desc = "Yank" })

vim.keymap.set({ "n", "x" }, "p", function()
  load_yanky(); return "<Plug>(YankyPutAfter)"
end, { desc = "Paste after" })

vim.keymap.set({ "n", "x" }, "P", function()
  load_yanky(); return "<Plug>(YankyPutBefore)"
end, { desc = "Paste before" })

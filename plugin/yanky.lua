vim.pack.add({
  "https://github.com/gbprod/yanky.nvim",
})

local _yanky_loaded = false

local function load_yanky()
  if _yanky_loaded then
    return
  end
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
end, { expr = true })

vim.keymap.set({ "n", "x" }, "p", function()
  load_yanky(); return "<Plug>(YankyPutAfter)"
end, { expr = true })

vim.keymap.set({ "n", "x" }, "P", function()
  load_yanky(); return "<Plug>(YankyPutBefore)"
end, { expr = true })

vim.pack.add({
  "https://github.com/folke/which-key.nvim"
})

local wk = require("which-key")
wk.setup({
  triggers = {},
})

vim.keymap.set("n", "<leader>?", function() wk.show({ global = true }) end, { desc = "Show Which Key" })

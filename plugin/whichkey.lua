vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim", load = false },
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("whichkey"),
  once = true,
  callback = function()
    vim.cmd.packadd("which-key.nvim")
    local wk = require("which-key")
    wk.setup({
      triggers = {},
      win = {
        border = "single",
      },
    })

    vim.keymap.set("n", "<leader>?", function() wk.show({ global = true }) end, { desc = "Show Which Key" })
  end,
})

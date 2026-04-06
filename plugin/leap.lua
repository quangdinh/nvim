vim.pack.add({
  { src = "https://codeberg.org/andyg/leap.nvim", load = false },
})

vim.api.nvim_create_autocmd("BufReadPre", {
  group = augroup("leap"),
  desc = "Load leap on BufReadPre",
  once = true,
  callback = function()
    vim.cmd.packadd("leap.nvim")
  end,
})

vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
vim.keymap.set("n", "S", "<Plug>(leap-from-window)")

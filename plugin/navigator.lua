vim.pack.add({
  { src = "https://github.com/numtostr/navigator.nvim", load = false },
})


vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("navigator"),
  once = true,
  callback = function()
    vim.cmd.packadd("navigator.nvim")
    local navigator = require("Navigator")
    navigator.setup()
    vim.keymap.set({ "n", "t" }, "<A-h>", "<CMD>NavigatorLeft<CR>")
    vim.keymap.set({ "n", "t" }, "<A-l>", "<CMD>NavigatorRight<CR>")
    vim.keymap.set({ "n", "t" }, "<A-k>", "<CMD>NavigatorUp<CR>")
    vim.keymap.set({ "n", "t" }, "<A-j>", "<CMD>NavigatorDown<CR>")
    vim.keymap.set({ "n", "t" }, "<A-p>", "<CMD>NavigatorPrevious<CR>")
  end,
})

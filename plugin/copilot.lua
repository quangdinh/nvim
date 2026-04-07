vim.pack.add({
  { src = "https://github.com/github/copilot.vim", load = false },
})

vim.g.copilot_no_tab_map = true

vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup("copilot"),
  desc = "Load Copilot on InsertEnter",
  once = true,
  callback = function()
    vim.cmd.packadd("copilot.vim")
    vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")',
      { silent = true, expr = true, script = true, desc = "Accept Copilot suggestion" })
    vim.api.nvim_set_keymap("i", "<C-u>", 'copilot#Next()',
      { silent = true, expr = true, script = true, desc = "Next Copilot suggestion" })
    vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Previous()',
      { silent = true, expr = true, script = true, desc = "Previous Copilot suggestion" })
  end,
})

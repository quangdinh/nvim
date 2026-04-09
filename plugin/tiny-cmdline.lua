vim.pack.add({
  { src = "https://github.com/rachartier/tiny-cmdline.nvim" },
})

vim.api.nvim_create_autocmd('VimEnter', {
  group = augroup('tiny-cmdline'),
  pattern = '*',
  once = true,
  callback = function()
    vim.cmd.packadd('tiny-cmdline')
    require('tiny-cmdline').setup({
      on_reposition = require("tiny-cmdline").adapters.blink,
    })
  end,
})

vim.pack.add({
  { src = "https://github.com/rachartier/tiny-code-action.nvim", load = false },
  { src = "https://github.com/nvim-lua/plenary.nvim",            load = false },
  { src = "https://github.com/folke/snacks.nvim",                load = false },
})

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  group = augroup("tca"),
  desc = "Setup tiny code action on Lsp Attach",
  once = true,
  callback = function()
    vim.cmd.packadd("plenary.nvim")
    vim.cmd.packadd("snacks.nvim")
    vim.cmd.packadd("tiny-code-action.nvim")
    local tca = require("tiny-code-action")
    tca.setup({
      picker = "snacks"
    })

    vim.keymap.set({ "n", "x" }, "<leader>ca", function()
      tca.code_action()
    end, { noremap = true, silent = true, desc = "Code action preview" })
  end,
})

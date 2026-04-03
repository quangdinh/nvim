vim.pack.add({
  "https://github.com/rachartier/tiny-code-action.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/snacks.nvim",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("tca"),
  desc = "Setup tiny code action on Lsp Attach",
  once = true,
  callback = function()
    local tca = require("tiny-code-action")
    tca.setup({
      picker = "snacks"
    })

    vim.keymap.set({ "n", "x" }, "<leader>ca", function()
      tca.code_action()
    end, { noremap = true, silent = true, desc = "Code action preview" })
  end,
})

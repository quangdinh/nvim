local M = {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local comment = require("Comment")
    comment.setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      ignore = "^$",
      toggler = { line = "<leader>cc", block = "<leader>bc" },
      opleader = { line = "<leader>c", lock = "<leader>b" },
    })
  end,
}

return M

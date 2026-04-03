vim.pack.add({
  "https://github.com/folke/noice.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
})

if vim.o.filetype == "lazy" then
  vim.cmd([[messages clear]])
end

require("noice").setup({
  lsp = {
    progress = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },

  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {},
    format = {
      cmdline = {
        pattern = "^:",
        icon = "",
        lang = "vim",
        title = "Command",
      },
      search_down = {
        kind = "search",
        pattern = "^/",
        icon = " ",
        lang = "regex",
      },
      search_up = {
        kind = "search",
        pattern = "^%?",
        icon = " ",
        lang = "regex",
      },
      filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
      lua = {
        pattern = {
          "^:%s*lua%s+",
          "^:%s*lua%s*=%s*",
          "^:%s*=%s*",
        },
        icon = "",
        lang = "lua",
      },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
      input = {},
    },
  },
})

-- Keymaps
vim.keymap.set({ "n" }, "<leader>sn", "", { desc = "+noice" })
vim.keymap.set("c", "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end,
  { desc = "Redirect Cmdline" })
vim.keymap.set("n", "<leader>snl", function() require("noice").cmd("last") end, { desc = "Noice Last Message" })
vim.keymap.set("n", "<leader>snh", function() require("noice").cmd("history") end, { desc = "Noice History" })
vim.keymap.set("n", "<leader>sna", function() require("noice").cmd("all") end, { desc = "Noice All" })
vim.keymap.set("n", "<leader>snd", function() require("noice").cmd("dismiss") end, { desc = "Dismiss All" })
vim.keymap.set("n", "<leader>snt", function() require("noice").cmd("pick") end, { desc = "Noice Picker" })
vim.keymap.set({ "i", "n", "s" }, "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
  { silent = true, expr = true, desc = "Scroll Forward" })
vim.keymap.set({ "i", "n", "s" }, "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
  { silent = true, expr = true, desc = "Scroll Backward" })

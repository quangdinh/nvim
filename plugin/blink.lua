vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x"), load = false },
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  pattern = "*",
  once = true,
  callback = function()
    vim.cmd.packadd("blink.cmp")
    require("blink.cmp").setup({
      keymap = {
        preset = "enter",
        ["<C-h>"] = { "show_documentation", "hide_documentation", "fallback" },
        ["<C-j>"] = { 'select_next', 'snippet_forward', 'fallback' },
        ["<C-k>"] = { 'select_prev', 'snippet_backward', 'fallback' },
        ["<Tab>"] = { 'select_next', 'snippet_forward', 'fallback' },
        ["<S-Tab>"] = { 'select_prev', 'snippet_backward', 'fallback' },
      },
      appearance = {
        nerd_font_variant = "mono",
        use_nvim_cmp_as_default = true,
      },

      completion = {
        menu = { border = "single" },
        documentation = { window = { border = "single" } },
      },
      signature = { enabled = true, window = { border = "single" } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
        implementation = "lua",
        sorts = {
          "exact",
          "score",
          "sort_text",
        },
      },
    })
  end,
})

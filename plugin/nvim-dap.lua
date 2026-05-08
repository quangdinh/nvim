vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-dap", load = false },
  { src = "https://github.com/nvim-neotest/nvim-nio", load = false },
  { src = "https://github.com/rcarriga/nvim-dap-ui", load = false },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("dap"),
  once = true,
  callback = function()
    vim.cmd.packadd("nvim-dap")
    vim.cmd.packadd("nvim-nio")
    vim.cmd.packadd("nvim-dap-ui")
    require("dapui").setup({
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 1.0 },
          },
          size = 10,
          position = "bottom",
        },
      },
    })
  end,
})

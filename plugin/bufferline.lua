vim.pack.add({
  { src = "https://github.com/akinsho/bufferline.nvim", load = false },
})

local cmdID = 0
-- Load only when there are more than 1 buffer, otherwise it just adds unnecessary overhead
-- Or load when LSp is attached to a buffer, so that diagnostics can be shown in the bufferline
cmdID = vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "LspAttach" }, {
  pattern = "*",
  callback = function()
    local bufCount = #vim.api.nvim_list_bufs()
    local lspCount = #vim.lsp.get_clients()
    if bufCount <= 1 or lspCount == 0 then
      return
    end

    if lspCount == 1 then
      local clients = vim.lsp.get_clients()
      local client = clients[1]
      if client.name ~= "Github Copilot" then
        return
      end
    end

    vim.cmd.packadd("bufferline.nvim")
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or " ")
            s = s .. n .. " " .. sym
          end
          return s
        end,
        offsets = {
          {
            filetype = "snacks_layout_box",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })
    vim.api.nvim_del_autocmd(cmdID)
  end,
})

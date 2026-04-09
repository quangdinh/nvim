function _G.augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

function _G.Toggle(option)
  local current = vim.opt[option]:get()
  if type(current) == 'boolean' then
    vim.opt[option] = not current
  else
    vim.notify('Unsupported option type: ' .. type(current), vim.log.levels.ERROR)
  end
end

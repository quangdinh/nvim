function _G.toggle_linenumbers()
  if (vim.opt.relativenumber:get() == false)
  then
    vim.opt.relativenumber = true
    vim.opt.number = false
  else
    vim.opt.relativenumber = false
    vim.opt.number = true
  end
end
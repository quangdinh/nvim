local M = {
	"navarasu/onedark.nvim",
  config = function()
    local onedark = require('onedark')
    onedark.setup({
      style = 'darker'
    })
    onedark.load()
  end
}

return M


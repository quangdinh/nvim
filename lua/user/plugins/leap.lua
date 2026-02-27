local M = {
  url = "https://codeberg.org/andyg/leap.nvim",
  event = { "BufEnter" },
  config = function()
    local leap = require("leap")
    leap.add_default_mappings()
  end,
}
return M

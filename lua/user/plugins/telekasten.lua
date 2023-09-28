local M = {
    "renerocksai/telekasten.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
        local t = require("telekasten")
        t.setup({
            home = vim.fn.expand("~/OneDrive/Notes") -- Put the name of your notes directory here
        })
    end
}

return M

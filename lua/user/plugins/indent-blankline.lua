local M = {
    "lukas-reineke/indent-blankline.nvim",
    tag = "v3.2.7",
    main = "ibl",
    config = function()
        local hightlight = {"IndentScope"}
        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IndentScope", {fg = "#aed3cf"})
        end)
        require("ibl").setup {
            indent = {char = "▏"},
            scope = {highlight = hightlight, char = "▎"}
        }
    end
}

return M

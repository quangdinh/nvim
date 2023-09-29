local M = {
    "lukas-reineke/indent-blankline.nvim",
    tag = "v2.20.8",
    config = function()
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = true,
            show_end_of_line = true
        })
    end
}

return M

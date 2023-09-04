local M = {
    "windwp/nvim-autopairs",
    dependencies = {"hrsh7th/nvim-cmp"},
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        local autopairs = require("nvim-autopairs")
        autopairs.setup({
            fast_wrap = {
                map = '<C-e>',
                enable_check_bracket_line = false,
                chars = {'{', '[', '(', '"', "'"},
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = '$',
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                check_comma = true,
                highlight = 'Search',
                highlight_grey = 'Comment'
            }
        })
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}

return M

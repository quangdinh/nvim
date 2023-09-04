local M = {
    'numToStr/Navigator.nvim',
    config = function()
        local navigator = require('Navigator')
        navigator.setup()
        vim.keymap.set({'n', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
        vim.keymap.set({'n', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
        vim.keymap.set({'n', 't'}, '<A-k>', '<CMD>NavigatorUp<CR>')
        vim.keymap.set({'n', 't'}, '<A-j>', '<CMD>NavigatorDown<CR>')
        vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')
    end
}

return M

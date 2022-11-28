require("mleonidas.set")
require("mleonidas.packer")
require("mleonidas.statusline")
require("mleonidas.octo")
require("mleonidas.rest")
require("mleonidas.go")
require("mleonidas.debugger")
require("mleonidas.vgit")
require("mleonidas.todo_comments")

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

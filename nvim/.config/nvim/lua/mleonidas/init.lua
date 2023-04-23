require("mleonidas.set")
require("mleonidas.lazy")
require("mleonidas.statusline")
require("mleonidas.octo")
require("mleonidas.rest")
require("mleonidas.go")
require("mleonidas.debugger")
require("mleonidas.vgit")
require("mleonidas.todo_comments")
require("mleonidas.telescope")
require("mleonidas.trim")

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

local mleone_group = augroup("Mleonidas", {})

autocmd("FileType", {
	group = mleone_group,
	pattern = "*.env",
	callback = function()
		vim.cmd([[setlocal commentstring=#\ %s]])
	end,
})

autocmd({ "TermOpen", "BufWinEnter", "WinEnter" }, {
	group = mleone_group,
	pattern = "term://*",
	callback = function()
		vim.cmd([[DisableWhitespace]])
	end,
})

local earthly = augroup("Earthly", {})

autocmd({ "FileType" }, {
	group = earthly,
	pattern = "Earthfile",
	callback = function()
		vim.cmd([[hi! link earthFileKeyword Underlined]])
	end,
})

autocmd({ "FileType" }, {
	group = earthly,
	pattern = "Earthfile",
	callback = function()
		vim.cmd([[setlocal commentstring=#\ %s]])
	end,
})

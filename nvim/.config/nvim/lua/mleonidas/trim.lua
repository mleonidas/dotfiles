local vim = vim
local api = vim.api

local M = {}

M.trail = function()
	local cfg = { patterns = {} }
	table.insert(cfg.patterns, [[%s/\s\+$//e]])
	local save = vim.fn.winsaveview()
	for _, v in ipairs(cfg.patterns) do
		api.nvim_exec2(string.format("keepjumps keeppatterns silent! %s", v), false)
	end
	vim.fn.winrestview(save)
end

return M

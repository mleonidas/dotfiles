-- local nmap = require("mleonidas.keymap").nmap
local nnoremap = require("mleonidas.keymap").nnoremap
-- local silent = { silent = true }

-- nmap("cz", function()
-- 	require("mleonidas.term").git_commit_toggle()
-- end, silent)

nnoremap("<Leader>gs", vim.cmd.Git)
-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Mleonidas_Fugitive = vim.api.nvim_create_augroup("Mleonidas_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = Mleonidas_Fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }
		vim.keymap.set("n", "<leader>p", function()
			vim.cmd.Git("push")
		end, opts)

		-- rebase always
		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git({ "pull", "--rebase" })
		end, opts)

		-- NOTE: It allows me to easily set the branch i am pushing and any tracking
		-- needed if i did not set the branch up correctly
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
	end,
})

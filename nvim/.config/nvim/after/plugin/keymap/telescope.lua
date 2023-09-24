local nnoremap = require("mleonidas.keymap").nnoremap

local silent = { silent = true }

-- telescope mappings
nnoremap("<leader>ff", function()
	require("telescope.builtin").find_files({ hidden = true, previewer = false })
end, silent)

nnoremap("<leader>fg", function()
	require("telescope").extensions.live_grep_args.live_grep_args()
end, silent)

nnoremap("<leader>bb", function()
	require("telescope.builtin").buffers()
end, silent)

nnoremap("<leader>fh", function()
	require("telescope.builtin").help_tags()
end, silent)

nnoremap("<leader>gb", function()
	require("mleonidas.telescope").git_branches()
end, silent)

nnoremap("<leader>tr", ":Telescope registers<cr>", silent)
nnoremap("<leader>tkm", ":Telescope keymaps<cr>", silent)

nnoremap("<C-p>", function()
	require("telescope.builtin").git_files({ previewer = false })
end, silent)

nnoremap("<leader>ctt", ":TodoTelescope<cr>", silent)

-- nnoremap("<leader>ps", function()
-- 	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ") })
-- end)

nnoremap("<leader>ps", ":Telescope live_grep previewer=false color=true<cr>")
nnoremap("<leader>pp", ":Telescope projects<cr>", silent)
nnoremap("<leader>:", function()
	require("telescope.builtin").command_history()
end)

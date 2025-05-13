-- local pickers = require("telescope.pickers")
-- local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
-- local pkgs = require("telescope").load_extension("project")
-- local action_state = require("telescope.actions.state")
-- local conf = require("telescope.config").values
local actions = require("telescope.actions")
-- local lst = require("telescope").extensions.luasnip

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { ".git/", "node_modules/" },
		prompt_prefix = " > ",
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
				["<C-o>"] = actions.open_qflist,
				["<CR>"] = actions.select_default,
			},
		},
	},
})

require("telescope").load_extension("git_worktree")
require("telescope").load_extension("luasnip")
-- require("telescope").load_extension("projects")
local M = {}

local function refactor(prompt_bufnr)
	local content = require("telescope.actions.state").get_selected_entry()
	require("telescope.actions").close(prompt_bufnr)
	require("refactoring").refactor(content.value)
end

M.refactors = function()
	require("telescope.pickers")
		.new({}, {
			prompt_title = "refactors",
			finder = require("telescope.finders").new_table({
				results = require("refactoring").get_refactors(),
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", refactor)
				map("n", "<CR>", refactor)
				return true
			end,
		})
		:find()
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

if vim.fn.executable("gh") == 1 then
	pcall(require("telescope").load_extension, "gh")
	pcall(require("telescope").load_extension, "octo")
end

return M

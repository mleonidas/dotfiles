-- vim.cmd(":TSInstall all");
--
--
require("Comment").setup()
require("toggleterm").setup({})
require("gitsigns").setup()
require("todo-comments").setup({
	signs = false,
})

require("smart-splits").setup()

require("git-worktree").setup({
	change_directory_command = "cd",
	update_on_change = true, -- default: true,
	update_on_change_command = "e .", -- default: "e .",
	autopush = false,
	clearjumps_on_change = true,
})

require("nvim-dap-projects").search_project_config()

require("colorizer").setup()

require("telescope").load_extension("harpoon")

require("oil").setup()

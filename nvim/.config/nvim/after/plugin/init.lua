-- vim.cmd(":TSInstall all");
--
--
require("Comment").setup()
require("toggleterm").setup({})
require("gitsigns").setup()
require("octo").setup()
require("todo-comments").setup({
	signs = false,
})

require("git-worktree").setup({
	change_directory_command = "cd",
})

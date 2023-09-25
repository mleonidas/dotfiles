-- vim.cmd(":TSInstall all");
--
--
require("Comment").setup()
require("toggleterm").setup({})
require("gitsigns").setup()
require("octo").setup()
require("inlay-hints").setup()
require("todo-comments").setup({
	signs = false,
})

require("git-worktree").setup({
	change_directory_command = "cd",
	update_on_change = true, -- default: true,
	update_on_change_command = "e .", -- default: "e .",
	autopush = false,
	clearjumps_on_change = true,
})

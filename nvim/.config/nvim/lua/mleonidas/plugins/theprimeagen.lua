return {
	{
		"ThePrimeagen/refactoring.nvim",
		commit = "c2b5a46",
		version = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup({})
		end,
	},
	-- Primeagen doesn"t create lodash
	"ThePrimeagen/git-worktree.nvim",
	{ "ThePrimeagen/harpoon", lazy = false },
}

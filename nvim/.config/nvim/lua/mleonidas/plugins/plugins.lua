return {
	-- show hex colors
	"norcalli/nvim-colorizer.lua",
	-- better whitespace ? TODO(mleonidas): rewrite in lua
	"ntpeters/vim-better-whitespace",
	"benfowler/telescope-luasnip.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"christoomey/vim-tmux-navigator",
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	"tmux-plugins/vim-tmux",
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	-- better git blame
	"f-person/git-blame.nvim",
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	"mbbill/undotree",
	"folke/lsp-colors.nvim",
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	"leoluz/nvim-dap-go",
	"ldelossa/nvim-dap-projects",
	{ "rcarriga/nvim-dap-ui", dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	} },
	"sebdah/vim-delve",
	"folke/todo-comments.nvim",
	"mhartington/formatter.nvim",
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			-- you'll need at least one of these
			-- {'nvim-telescope/telescope.nvim'},
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup()
		end,
	},
}

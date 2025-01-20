return {
	"mrjones2014/smart-splits.nvim",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- there's got to be a better way
	"vim-test/vim-test",
	"godlygeek/tabular",
	"numToStr/Comment.nvim",
	"kyazdani42/nvim-web-devicons",
	"simrat39/rust-tools.nvim",
	"simrat39/symbols-outline.nvim",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"vim-crystal/vim-crystal",
	-- "github/copilot.vim",
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}

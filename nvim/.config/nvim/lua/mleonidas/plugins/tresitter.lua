return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	"romgrk/nvim-treesitter-context",
	"nvim-treesitter/playground",
	"RRethy/nvim-treesitter-endwise",
}

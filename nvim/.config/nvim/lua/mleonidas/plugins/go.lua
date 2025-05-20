return {
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				run_in_floaterm = true,
				test_runner = "ginkgo",
				lsp_inlay_hints = {
					enable = true,
				},
				trouble = true,
				luasnip = true,
				lsp_on_attach = true,
				floaterm = { -- position
					posititon = "center", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
					title_colors = "tokyo",
				},
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
}

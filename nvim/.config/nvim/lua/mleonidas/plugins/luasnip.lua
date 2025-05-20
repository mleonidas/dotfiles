return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- cmp_nvim_lsp
		"neovim/nvim-lspconfig", -- lspconfig
		"onsails/lspkind-nvim", -- lspkind (VS pictograms)
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" }, -- Snippets
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				-- https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/go.json
			end,
		},
		{ "saadparwaiz1/cmp_luasnip", enabled = true },
	},
	config = function()
		local luasnip = require("luasnip")
		local types = require("luasnip.util.types")

		-- Display virtual text to indicate snippet has more nodes
		luasnip.config.setup({
			ext_opts = {
				[types.choiceNode] = {
					active = { virt_text = { { "⇥", "GruvboxRed" } } },
				},
				[types.insertNode] = {
					active = { virt_text = { { "⇥", "GruvboxBlue" } } },
				},
			},
		})

		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_mappings = {
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-p>"] = cmp.mapping.select_prev_item({ select = false }),
			["<C-n>"] = cmp.mapping.select_next_item({ select = false }),
			["<C-y>"] = cmp.mapping.confirm({ select = false }),
			-- Navigate between snippet placeholder
			["<C-Space>"] = cmp.mapping.complete({ select = false }),
		}

		cmp.setup({

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp_mappings,
			sources = {
				{ name = "luasnip", keyword_length = 2 },
				{ name = "nvim_lsp", keyword_length = 3 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "supermaven", keyword_length = 3 },
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 70,
					show_labelDetails = true,
				}),
			},
		})
	end,
}

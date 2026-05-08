return {
	"Saghen/blink.cmp",
	dependencies = {
		"onsails/lspkind-nvim",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},
	version = "1.*",
	opts = {
		snippets = { preset = "luasnip" },
		keymap = {
			preset = "none",
			["<CR>"] = { "accept", "fallback" },
			["<C-y>"] = { "accept", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev", "minuet" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				minuet = {
					name = "minuet",
					module = "minuet.blink",
					score_offset = 8,
				},
			},
		},
		completion = {
			documentation = {
				auto_show = true,
				window = { border = "rounded" },
			},
			menu = {
				border = "rounded",
				min_width = 30,
				draw = {
					columns = {
						{ "kind_icon", gap = 1 },
						{ "label", "label_description", gap = 1 },
						{ "kind", gap = 1 },
					},
					components = {
						kind_icon = {
							text = function(ctx)
								local lspkind = require("lspkind")
								local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
								return icon ~= "" and icon or ctx.kind_icon
							end,
							highlight = function(ctx)
								return "BlinkCmpKind" .. ctx.kind
							end,
						},
						label = {
							width = { max = 50 },
						},
						label_description = {
							width = { max = 20 },
							text = function(ctx)
								return ctx.label_detail or ""
							end,
							highlight = "BlinkCmpLabelDescription",
						},
						kind = {
							width = { max = 14 },
							text = function(ctx)
								return "(" .. ctx.kind .. ")"
							end,
							highlight = function(ctx)
								return "BlinkCmpKind" .. ctx.kind
							end,
						},
					},
				},
			},
		},
	},
}

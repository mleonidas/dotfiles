-- vim.g.solarized_italic_comments = true
-- require('solarized').set()
--
-- vim.cmd("colorscheme solarized")

-- require("tokyonight").setup({
-- 	priority = 1000,
-- 	style = "storm",
-- 	lazy = false,
-- 	styles = {
-- 		comments = { italic = true },
-- 		keywords = { italic = true },
-- 		functions = { italic = true },
-- 		variables = {},
-- 		floats = "dark", -- style for floating windows
--
-- 		-- Background styles. Can be "dark", "transparent" or "normal"
-- 		sidebars = {
-- 			"qf",
-- 			"vista_kind",
-- 			"terminal",
-- 			"spectre_panel",
-- 			"startuptime",
-- 			"Outline",
-- 		},
-- 	},
-- 	on_highlights = function(hl, c)
-- 		hl.CursorLineNr = { fg = c.orange, bold = true }
-- 		hl.LineNr = { fg = c.orange, bold = true }
-- 		hl.LineNrAbove = { fg = c.fg_gutter }
-- 		hl.LineNrBelow = { fg = c.fg_gutter }
-- 		local prompt = "#2d3149"
-- 		hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
-- 		hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
-- 		hl.TelescopePromptNormal = { bg = prompt }
-- 		hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
-- 		hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
-- 		hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
-- 		hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
-- 		hl.rustFuncName = { fg = c.blue }
-- 		hl.rustMacro = { fg = c.green }
-- 		hl["@function.macro"] = { fg = c.red }
-- 		hl.rustFuncName = { fg = c.blue }
-- 		hl.rustSelf = { fg = c.green }
-- 		hl["@namespace"] = { fg = c.green1 }
-- 	end,
-- })

-- vim.cmd("colorscheme tokyonight-storm")
--
--
require("rose-pine").setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = "moon",
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = "base",
		background_nc = "_experimental_nc",
		panel = "surface",
		panel_nc = "base",
		border = "highlight_med",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		-- ColorColumn = { bg = "rose" },

		-- Blend colours against the "base" background
		CursorLine = { bg = "foam", blend = 10 },
		StatusLine = { fg = "love", bg = "love", blend = 10 },
	},
})

vim.cmd("colorscheme rose-pine")

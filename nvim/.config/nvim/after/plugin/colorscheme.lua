-- vim.g.solarized_italic_comments = true
-- require('solarized').set()
--
-- vim.cmd("colorscheme solarized")

require("tokyonight").setup({
	priority = 1000,
	style = "storm",
	lazy = false,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = false },
		variables = {},
		floats = "dark", -- style for floating windows

		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = {
			"qf",
			"vista_kind",
			"terminal",
			"spectre_panel",
			"startuptime",
			"Outline",
		},
	},
	on_highlights = function(hl, c)
		hl.CursorLineNr = { fg = c.orange, bold = true }
		hl.LineNr = { fg = c.orange, bold = true }
		hl.LineNrAbove = { fg = c.fg_gutter }
		hl.LineNrBelow = { fg = c.fg_gutter }
		local prompt = "#2d3149"
		hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
		hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
		hl.TelescopePromptNormal = { bg = prompt }
		hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
		hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
		hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
		hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
		hl.rustFuncName = { fg = c.blue }
		hl.rustMacro = { fg = c.green }
		hl["@function.macro"] = { fg = c.red }
		hl.rustFuncName = { fg = c.blue }
		hl.rustSelf = { fg = c.green }
		hl["@namespace"] = { fg = c.green1 }
	end,
})

vim.cmd("colorscheme tokyonight-storm")

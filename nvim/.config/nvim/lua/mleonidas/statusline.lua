local lualine = require("lualine")

-- tokyonight-storm palette
local colors = {
	bg = "#24283b",
	bg_statusline = "#1f2335",
	fg = "#c0caf5",
	fg_dark = "#a9b1d6",
	red = "#f7768e",
	orange = "#ff9e64",
	yellow = "#e0af68",
	green = "#9ece6a",
	cyan = "#7dcfff",
	blue = "#7aa2f7",
	magenta = "#bb9af7",
	purple = "#9d7cd8",
	comment = "#565f89",
}

-- highlights used inside the inline branch+diff component
local function set_hls()
	vim.api.nvim_set_hl(0, "StlBranch", { fg = colors.magenta, bg = colors.bg, bold = true })
	vim.api.nvim_set_hl(0, "StlDiffAdd", { fg = colors.green, bg = colors.bg })
	vim.api.nvim_set_hl(0, "StlDiffDel", { fg = colors.red, bg = colors.bg })
	vim.api.nvim_set_hl(0, "StlDiffChg", { fg = colors.yellow, bg = colors.bg })
end
set_hls()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hls })

-- redraw statusline on macro start/stop so the indicator shows immediately
vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
	callback = function() vim.cmd("redrawstatus") end,
})

local mode_alias = {
	n = "<N>",
	i = "<I>",
	c = "<C>",
	v = "<V>",
	V = "<V>",
	[""] = "<V>",
	R = "<R>",
	s = "<S>",
	S = "<S>",
	t = "<T>",
}

local mode_color = {
	n = colors.red,
	i = colors.green,
	v = colors.blue,
	V = colors.blue,
	[""] = colors.blue,
	c = colors.magenta,
	R = colors.purple,
	s = colors.orange,
	S = colors.orange,
	[""] = colors.orange,
	t = colors.red,
}

local function branch_with_diff()
	local head = vim.b.gitsigns_head
	if not head or head == "" then
		return ""
	end
	local d = vim.b.gitsigns_status_dict or {}
	local parts = {}
	if (d.added or 0) > 0 then
		table.insert(parts, "%#StlDiffAdd#+" .. d.added)
	end
	if (d.removed or 0) > 0 then
		table.insert(parts, "%#StlDiffDel#-" .. d.removed)
	end
	if (d.changed or 0) > 0 then
		table.insert(parts, "%#StlDiffChg#~" .. d.changed)
	end
	local diff = ""
	if #parts > 0 then
		diff = "%#StlBranch#(" .. table.concat(parts) .. "%#StlBranch#)"
	end
	local icon = "\xee\x9c\xa5" -- U+E725 nf-dev-git_branch (matches starship)
	return "%#StlBranch# " .. icon .. " " .. head .. diff
end

local function position()
	return vim.api.nvim_eval_statusline("%l:%c", {}).str
end

local function macro_recording()
	local reg = vim.fn.reg_recording()
	if reg == "" then return "" end
	return "recording @" .. reg
end

local function search_count()
	if vim.v.hlsearch == 0 then return "" end
	local ok, sc = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 250 })
	if not ok or sc.total == 0 then return "" end
	if sc.incomplete == 1 then return "[?/?]" end
	return string.format("[%d/%d]", sc.current, sc.total)
end

local function lsp_names()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then return "" end
	local names = {}
	for _, c in ipairs(clients) do table.insert(names, c.name) end
	return " " .. table.concat(names, ",")
end

local function scrollbar()
	local sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
	local cur = vim.fn.line(".")
	local total = vim.fn.line("$")
	if total == 0 then
		return ""
	end
	local i = math.min(#sbar, math.floor((cur - 1) / total * #sbar) + 1)
	return string.rep(sbar[i], 2)
end

lualine.setup({
	options = {
		component_separators = "",
		section_separators = "",
		globalstatus = true,
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.comment, bg = colors.bg } },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {
			{
				function()
					return mode_alias[vim.fn.mode()] or vim.fn.mode()
				end,
				color = function()
					return { fg = mode_color[vim.fn.mode()] or colors.red, gui = "bold" }
				end,
				padding = { left = 1, right = 1 },
			},
			{
				"filetype",
				icon_only = true,
				colored = true,
				padding = { left = 0, right = 1 },
			},
			{
				"filename",
				path = 1, -- relative path
				symbols = { modified = "[+]", readonly = "[ro]", unnamed = "[no name]" },
				color = { fg = colors.cyan },
				padding = { left = 0, right = 1 },
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = "● ", warn = "● ", info = "● ", hint = "● " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn  = { fg = colors.yellow },
					info  = { fg = colors.cyan },
					hint  = { fg = colors.green },
				},
				update_in_insert = false,
				padding = { left = 1, right = 1 },
			},
			{
				macro_recording,
				color = { fg = colors.red, gui = "bold" },
			},
			{
				search_count,
				color = { fg = colors.orange },
			},
		},
		lualine_x = {
			{
				lsp_names,
				color = { fg = colors.comment },
				padding = { left = 1, right = 0 },
			},
			{
				branch_with_diff,
				padding = { left = 1, right = 2 },
			},
			{
				position,
				color = { fg = colors.fg },
				padding = { left = 0, right = 1 },
			},
			{
				scrollbar,
				color = function()
					return { fg = mode_color[vim.fn.mode()] or colors.blue, bg = colors.bg }
				end,
				padding = { left = 0, right = 0 },
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = { { "filename", path = 1, color = { fg = colors.comment } } },
		lualine_x = {},
	},
})

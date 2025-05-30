local util = require("formatter.util")
local rfmt = function()
	return {
		exe = "Rscript",
		args = {
			"-e 'styler::style_file(\"" .. util.escape_path(util.get_current_buffer_file_path()) .. "\")'",
		},
	}
end
require("formatter").setup({
	filetype = {
		r = { rfmt },
		-- javascriptreact = { require("formatter.defaults.prettier") },
		-- javascript = { require("formatter.defaults.prettier") },
		-- typescriptreact = { require("formatter.defaults.prettier") },
		-- typescript = { require("formatter.defaults.prettier") },
		-- svelte = { require("formatter.filetypes.svelte").prettier },
		json = { require("formatter.defaults.prettier") },
		markdown = { require("formatter.defaults.prettier") },
		scss = { require("formatter.defaults.prettier") },
		html = { require("formatter.defaults.prettier") },
		css = { require("formatter.defaults.prettier") },
		svg = { require("formatter.defaults.prettier") },
		lua = { require("formatter.filetypes.lua").stylua },
		rust = { require("formatter.filetypes.rust").rustfmt },
		terraform = { require("formatter.filetypes.terraform").terraformfmt },
		-- go = { require("formatter.filetypes.go").goimports },
		-- gofumpt = { require("formatter.filetypes.go").gofumpt },
		sql = { require("formatter.filetypes.sql").pgformat },
		proto = { require("formatter.filetypes.proto").buf_format },
		zig = { require("formatter.filetypes.zig").zigfmt },
		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

vim.api.nvim_exec2(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]],
	{ output = false }
)

-- alternative, we can use vim.cmd instead of vim.api.nvim_exec2
-- vim.cmd([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost * FormatWrite
--   augroup END
-- ]])
--

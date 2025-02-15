return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					markdown = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					css = { "prettier" },
					yaml = { "prettier" },
					sql = { "pg_format" },
					proto = { "buf_format" },
					lua = { "stylua" },
					["*"] = { "codespell" },
					["_"] = { "trim_whitespace" },
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 1000,
					async = false,
				},
			})
		end,
	},
}

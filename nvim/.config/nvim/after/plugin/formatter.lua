require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = false,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "ruff" },
		rust = { "rustfmt" },
		terraform = { "terraform_fmt" }, -- Use
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		go = { "golangci-lint", "gci", "gofumpt" },
		jsonnet = { "jsonnetfmt" },
		json = { "prettierd", "prettier", stop_after_first = true },
		zig = { "zigfmt" },
		proto = { "buf_format" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

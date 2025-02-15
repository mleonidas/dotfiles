local lsp_zero = require("lsp-zero")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

local signs = { Error = "", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("mason").setup({})

local mason_tool_installer = require("mason-tool-installer")
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"gopls",
		"terraformls",
		"pyright",
		"dockerls",
		"docker_compose_language_service",
		"bashls",
		"eslint",
		"cssls",
		"buf_ls",
		"lua_ls",
		"svelte",
		"zls",
	},

	handlers = {
		lsp_zero.defult_setup,
	},
})
mason_tool_installer.setup({
	ensure_installed = {
		"prettier",
		"stylua",
	},
})

lspconfig.ts_ls.setup({
	capabilities = lsp_capabilities,
})

lspconfig.svelte.setup({
	capabilities = lsp_capabilities,
})
lspconfig.bashls.setup({})

lspconfig.pyright.setup({
	capabilities = lsp_capabilities,
})

lspconfig.zls.setup({})

require("lspconfig").gleam.setup({})

-- Fix Undefined global 'vim'
lspconfig.lua_ls.setup({
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.buf_ls.setup({})

lspconfig.gopls.setup({
	capabilities = lsp_capabilities,
	settings = {
		gopls = {
			env = { GOFLAGS = "-tags=!windows" },
			-- analyses = {
			-- 	fieldalignment = true,
			-- },
			codelenses = { test = true },
			-- hints = {
			-- 	assignVariableTypes = true,
			-- 	compositeLiteralFields = true,
			-- 	compositeLiteralTypes = true,
			-- 	constantValues = true,
			-- 	functionTypeParameters = false,
			-- 	parameterNames = true,
			-- 	rangeVariableTypes = false,
			-- },
		},
	},
})

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require("lsp-zero").cmp_action()
local cmp_mappings = {
	["<CR>"] = cmp.mapping.confirm({ select = false }),
	["<C-p>"] = cmp.mapping.select_prev_item({ select = false }),
	["<C-n>"] = cmp.mapping.select_next_item({ select = false }),
	["<C-y>"] = cmp.mapping.confirm({ select = false }),
	-- Navigate between snippet placeholder
	["<C-f>"] = cmp_action.luasnip_jump_forward(),
	["<C-b>"] = cmp_action.luasnip_jump_backward(),
	["<C-Space>"] = cmp.mapping.complete({ select = false }),
}

cmp.setup({
	sources = {
		{ name = "luasnip", keyword_length = 2 },
		{ name = "nvim_lsp", keyword_length = 3 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "supermaven", keyword_length = 3 },
	},
	mapping = cmp_mappings,
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

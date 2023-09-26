local lsp_zero = require("lsp-zero")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local inlays = require("mleonidas.lsp.inlay")

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

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"gopls",
		"terraformls",
		"pyright",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"cssls",
		"bufls",
		"lua_ls",
		"svelte",
	},

	handlers = {
		lsp_zero.defult_setup,
	},
})

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

lspconfig.gopls.setup({
	capabilities = lsp_capabilities,
	settings = {
		gopls = {
			env = { GOFLAGS = "-tags=!windows" },
			codelenses = { test = true },
			hints = inlays and {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			} or nil,
		},
	},
})

require("lspconfig.configs").crystalline = {
	default_config = {
		name = "crystalline",
		cmd = { "/Users/mleone/.bin/crystalline" },
		filetypes = { "crystal", "cr" },
		root_dir = require("lspconfig.util").root_pattern({ "shard.yml" }),
	},
}

require("lspconfig").crystalline.setup({})

lsp_zero.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp_zero.setup()

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(client, bufnr)
			-- turn off semanticTokens
			client.server_capabilities.semanticTokensProvider = nil
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

require("rust-tools").inlay_hints.enable()

local signconfig = {
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
}

vim.diagnostic.config(signconfig)

-- require("tabnine").setup({
-- 	disable_auto_comment = true,
-- 	accept_keymap = "<C-J>",
-- 	dismiss_keymap = "<C-]>",
-- 	debounce_ms = 800,
-- 	suggestion_color = { gui = "#808080", cterm = 244 },
-- 	exclude_filetypes = { "TelescopePrompt" },
-- 	log_file_path = nil, -- absolute path to Tabnine log file
-- })
--
-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false },
-- 	accept_keymap = "<c-J>",
-- })

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
		-- { name = "copilot", keyword_length = 2 },

		-- { name = "cmp_tabnine", keyword_length = 3 },
	},
	mapping = cmp_mappings,
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

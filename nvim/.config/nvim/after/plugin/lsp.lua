local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
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
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.configure("gopls", {
	settings = {
		gopls = {
			env = { GOFLAGS = "-tags=!windows" },
		},
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
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

lsp.setup()

local signconfig = {
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
}

vim.diagnostic.config(signconfig)

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
		local format_cmd = function(input)
			vim.lsp.buf.format({
				id = client.id,
				timeout_ms = 5000,
				async = input.bang,
			})
		end

		local bufcmd = vim.api.nvim_buf_create_user_command
		bufcmd(bufnr, "NullFormat", format_cmd, {
			bang = true,
			range = true,
			desc = "Format using null-ls",
		})
	end,
	sources = {
		--- Replace these with the tools you have installed
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.stylua,
	},
})

local tabnine = require("cmp_tabnine.config")

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
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
		{ name = "cmp_tabnine", keyword_length = 3 },
	},
	mapping = cmp_mappings,
})

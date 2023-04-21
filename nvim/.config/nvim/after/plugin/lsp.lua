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

local source_mapping = {
	luasnip = "[Snip]",
	buffer = "[Buf]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[api]",
	path = "[Path]",
	cmp_tabnine = "[TN]",
}

local tabnine = require("cmp_tabnine.config")

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

local cmp_sources = lsp.defaults.cmp_sources()

table.insert(cmp_sources, { name = "luasnip" })
table.insert(cmp_sources, { name = "nvim_lsp", keyword_length = 3 })
table.insert(cmp_sources, { name = "treesitter" })
table.insert(cmp_sources, { name = "cmp_tabnine" })
table.insert(cmp_sources, { name = "buffer", keyword_length = 3 })

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

-- lsp.setup_nvim_cmp({
--     formatting = {
--         fields = { "abbr", "kind", "menu" },
--         format = require("lspkind").cmp_format({
--             mode = "symbol", -- show only symbol annotations
--             maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--             ellipsis_char = "...",
--             before = function(entry, vim_item)
--                 local menu = source_mapping[entry.source.name]
--                 if entry.source.name == "cmp_tabnine" then
--                     if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
--                         menu = entry.completion_item.data.detail .. " " .. menu
--                     end
--                     vim_item.kind = ""
--                 end
--                 vim_item.menu = menu
--                 return vim_item
--             end,
--         }),
--         mapping = cmp_mappings,
--     },
-- })

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

require("luasnip.loaders.from_vscode").lazy_load()

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

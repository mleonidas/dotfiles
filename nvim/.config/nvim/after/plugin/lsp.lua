local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

local Remap = require("mleonidas.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap


capabilities.textDocument.completion.completionItem.snippetSupport = true

-- setup some bs for lua language server on osx
local sumneko_binary_path = vim.fn.exepath("lua-language-server")
local sumneko_root_path = "/opt/homebrew/Cellar/lua-language-server/3.5.2/libexec/bin/"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local signconfig = {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
}

vim.diagnostic.config(signconfig)

local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
            local opts = { buffer = true };
			nnoremap("gd", function() vim.lsp.buf.definition() end, opts)
			nnoremap("K", function() vim.lsp.buf.hover() end, opts)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
			nnoremap("[d", function() vim.diagnostic.goto_next() end, opts)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end, opts)
			nnoremap("<leader>xca", function() vim.lsp.buf.code_action() end, opts)
			nnoremap("<leader>xco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end, opts)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end, opts)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end, opts)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end,
	}, _config or {})
end


vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

require 'lspconfig'.yamlls.setup(config())

-- require'lspconfig'.pylsp.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         formatCommand = {"black"},
--         pylsp = {
--             plugins = {
--                 pycodestyle = {
--                     maxLineLength = 100
--                 },
--                 pyls_flake8 = { enabled = false },
--                 pylint = { enabled = true,
--                 args = { '--rcfile','~/Documents/repos/work/flowcode-api/pyproject.toml' }
--             },
--             black = { enabled = true },
--             isort = { enabled = true },
--             pyls_mypy = {
--                 enabled = true,
--                 --live_mode = true,
--             },
--         },
--     }
-- }
--
--
--
-- })
--
local python_root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
}

require 'lspconfig'.pyright.setup(config {
    root_dir = nvim_lsp.util.root_pattern(unpack(python_root_files)),
    settings = {
        typeCheckingMode = "off",
    }
})
require("lspconfig").tsserver.setup(config())

require 'lspconfig'.terraformls.setup(config({
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
}))

require 'lspconfig'.graphql.setup(config())
require("lspconfig").tsserver.setup(config())
require 'lspconfig'.solargraph.setup(config({
    settings = {
        solargraph = {
            commandPath = '/Users/mleone/.asdf/shims/solargraph',
            diagnostics = true,
            completion = true,
        }
    },
    flags = {
        debounce_text_changes = 150,
    },
}))

-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
}))



local rt = require("rust-tools")
rt.setup(config())

require("lspconfig").sumneko_lua.setup(config({
    cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}))


require('lspconfig').gopls.setup(config({
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
}))

function org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, 'utf-16')
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

require("luasnip.loaders.from_vscode").lazy_load()

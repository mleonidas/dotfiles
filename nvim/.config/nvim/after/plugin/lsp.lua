local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()


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

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
        vim.diagnostic.disable()
    end
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, bufopts)
end


capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

require 'lspconfig'.yamlls.setup({
    on_attach = on_attach
})

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

require 'lspconfig'.pyright.setup({
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern(unpack(python_root_files)),
    settings = {
        typeCheckingMode = "off",
    }
})
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
})

require 'lspconfig'.terraformls.setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
})

require 'lspconfig'.graphql.setup({
    on_attach = on_attach,
})
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
})
require 'lspconfig'.solargraph.setup({
    on_attach = on_attach,
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
})

local rust_opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(rust_opts)

require("lspconfig").sumneko_lua.setup({
    cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
    on_attach = on_attach,
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
})


require('lspconfig').gopls.setup({
    on_attach = on_attach,
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
})

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

require'lspconfig'.metals.setup({
    on_attach = on_attach,
})


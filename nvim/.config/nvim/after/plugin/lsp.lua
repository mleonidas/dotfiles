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


local on_attach = function(client, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
        vim.diagnostic.disable()
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gic', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)

    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>rnn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.document_formatting then
        buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.server_capabilities.document_range_formatting then
        buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

end



vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

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

-- who even uses this?
--
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

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
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

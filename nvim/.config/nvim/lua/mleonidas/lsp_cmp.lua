local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
            luasnip = "[snip]",
        },
      },
    },

    experimental = {
        native_menu = false,
        ghost_text = false,
    },

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp', keyword_length = 3 },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'treesitter' },
    }, {
      { name = 'buffer', keyword_length = 3},
    })
  })

  -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


-- local Group = require("colorbuddy.group").Group
-- local g = require("colorbuddy.group").groups
-- -- local s = require("colorbuddy.style").styles
--
-- Group.new("CmpItemAbbr", g.Comment)

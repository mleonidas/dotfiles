if not pcall(require, 'nvim-treesitter') then
  print("Warning: treesitter not available, skipping configuration.")
  return
end


local ts_configs = require("nvim-treesitter.configs")
-- local ts_parsers = require("nvim-treesitter.parsers")

local parsers_to_install = {
   "python", "go", "json", "http", "ruby", "graphql", "go", "bash", "comment", "proto",
   "hcl", "make", "dockerfile"
}

if vim.fn.has('mac') > 0 then
  -- Disable 'dockerfile' until nvim-treesitter/nvim-treesitter#3515 is resolved
  parsers_to_install = vim.tbl_filter(function(x) return x ~= "dockerfile" end, parsers_to_install)
  pcall(function() require 'nvim-treesitter.install'.uninstall('dockerfile') end)
end

ts_configs.setup {
  ensure_installed = parsers_to_install,
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust"},  -- list of language that will be disabled
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}



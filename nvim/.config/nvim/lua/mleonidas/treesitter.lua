require'nvim-treesitter.configs'.setup {
ensure_installed = {"python", "json", "http", "ruby", "graphql", "go", "bash", "comment", "proto", "hcl", "make"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust"},  -- list of language that will be disabled
  },
}

require"nvim-treesitter.highlight".set_custom_captures {
  ["keyword.function"] = "Statement",
  ["punctuation.bracket"] = "Normal",

  -- ["variable"] = "Underlined",
}
require "nvim-treesitter.configs".setup {
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

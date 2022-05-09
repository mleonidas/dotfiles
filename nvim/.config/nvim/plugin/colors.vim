" bash overrides for treesitter syntax highlighting
hi! link bashTSConstant Function

" golang overrides
hi! link goTSNamespace Normal
hi! link goTSInclude Keyword 

" ruby
hi! link rubyTSSymbol Todo



lua << EOF
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
EOF


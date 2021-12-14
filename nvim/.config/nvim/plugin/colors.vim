
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" yaml
set background=dark

" colo gruvbox
colo solarized8

hi VertSplit ctermbg=NONE guibg=NONE

hi link yamlDirective Function
hi link yamlDocumentHeader Function

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

let g:solarized_termcolors=256
let g:solarized_termtrans = 1
let g:solarized_visibility="high"

lua << EOF
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
EOF

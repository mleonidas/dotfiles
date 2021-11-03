
hi VertSplit ctermbg=black guibg=black ctermfg=161

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
highlight clear SignColumn

" yaml
hi link yamlDirective Function
hi link yamlDocumentHeader Function

" " set popup menu colors
" hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
" hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

set background=dark

colo solarized8

" autocmd vimenter * ++nested colorscheme solarized8

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

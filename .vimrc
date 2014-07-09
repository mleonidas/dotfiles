" -file setup
:syntax on
:set ignorecase
:set number
:set mouse=
:set hlsearch
:set background=dark
:set incsearch
:set encoding=utf-8
:set fileencoding=utf-8
:set fileformat=unix

set t_Co=256
" Auto reload conf
autocmd! bufwritepost .vimrc source %
"ctrl-p
let g:ctrlp_map = '<c-m>'
set runtimepath^=~/.vim/bundle/ctrlp.vim

"set the colorscheme
colo mleone_colo 
"
"kolor stuff
"
let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

" quick save
let mapleader = ","
noremap <Leader>s :update<CR>




"colo kolor
" tab stuff
:set autoindent
:set expandtab
:set smarttab
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2


"set navigation for splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-E> <C-W>=
map <C-B> <C-W><bar>
map <C-P> :set paste nonumber<Return>
map <C-N> :set nopaste number<Return>
nnoremap <C-t>     :tabnew<CR>

" navigation (from http://statico.github.com/vim.html)
" go up and down one row, not one line (useful for wrapped lines)
:nmap j gj
:nmap k gk
" tab next/prev with shift h and shift l
nnoremap <S-h> gT
nnoremap <S-l> gt
" jump between last opened buffer with Ctrl+E (:b# and :e# do same thing)
:nmap <C-e> :e#<CR>

" title setting
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

" assorted automatic syntax loading. filetype -> syntax
au BufRead *.md set filetype=markdown
au BufRead *.scala set filetype=scala
au BufRead *.pp set filetype=puppet
au BufRead *.rb set filetype=ruby
" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm" || &term == "xterm-color" || &term == "xterm-256color"
  set title
endif

" ctrl-p mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <Leader>n :lnext <CR>
noremap <Leader>p :lprev <CR>
"syntastic
let g:syntastic_always_populate_loc_list = 1
execute pathogen#infect()
filetype plugin indent on


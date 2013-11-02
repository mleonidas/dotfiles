
" Auto reload conf
autocmd! bufwritepost .vimrc source %
" set syntax highlighting on
syntax on
" always show current position
set ruler

set background=dark
set viminfo='20,\"500
set tabstop=2 shiftwidth=2 expandtab
set nohlsearch
set ignorecase smartcase
autocmd FileType php set smartindent
autocmd FileType javascript set smartindent
autocmd FileType python set smartindent
autocmd FileType c set smartindent noexpandtab
autocmd FileType ruby set smartindent noexpandtab
set encoding=utf8

" set the leaderkey
let mapleader=","
" set navigation for splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-E> <C-W>=
map <C-B> <C-W><bar>
map <C-P> :set paste nonumber<Return>
map <C-N> :set nopaste number<Return>



"quick save
noremap <Leader>s :update<CR>
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()




set wmw=0
set wmh=0
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/
highlight TrailingSpace ctermbg=red ctermfg=white guibg=#592929
au InsertEnter * match TrailingSpace /\s\+\%#\@<!$/
au InsertLeave * match TrailingSpace /\s\+$/
set laststatus=2
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor


execute pathogen#infect()
syntax on
filetype plugin indent on

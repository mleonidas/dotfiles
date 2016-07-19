source ~/.nvim_bundles

filetype plugin indent on
syntax on
set ignorecase
set relativenumber number 
set mouse=
set hlsearch
set background=dark
set incsearch
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set autoindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set t_Co==16
"set t_Co=256


set background=dark

" filetype indentation specific
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 autoindent
autocmd Filetype puppet  setlocal ts=2 sts=2 sw=2 autoindent 
autocmd Filetype sh setlocal ts=4 sts=4 sw=4 autoindent 
autocmd Filetype go setlocal ts=4 sts=4 sw=4 autoindent 
autocmd BufNewFile,BufRead *_foo.rb set syntax=rspec




" solarized config for iterm2
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans =  1
let g:solarized_termcolors=16
colo solarized


set cursorline

" change the split size to be more like tmux
"
set fillchars+=vert:│
hi VertSplit ctermbg=black guibg=black ctermfg=161

" make Y behave like other capitols
nnoremap Y y$
" iterm2 things ctrl-h is BS
if has('nvim')
     nnoremap <BS> <C-W>h
endif

" open splits 
set splitbelow
set splitright

" Paste shortcuts
map <C-G> :set paste norelativenumber nonumber <Return>
map <C-N> :set nopaste relativenumber<Return>

" quickly open a new tab
nnoremap <C-t>     :tabnew<CR>

" run tests !!
nnoremap g<CR> :Dispatch<CR>
augroup Ruby
  autocmd!
  autocmd FileType Ruby let b:dispatch='bundle exec rake rspec %'
augroup END


" navigation (from http://statico.github.com/vim.html)
" go up and down one row, not one line (useful for wrapped lines)
:nnoremap j gj
:nnoremap k gk

" tab next/prev with shift h and shift l
" jump between last opened buffer with Ctrl+E (:b# and :e# do same thing)
:nmap <C-e> :e#<CR>


" assorted automatic syntax loading. filetype -> syntax
au BufRead *.md set filetype=markdown
au BufRead *.scala set filetype=scala
au BufRead *.pp set filetype=puppet 
au BufRead *.rb set filetype=ruby 
au BufRead *.go set filetype=go 
au BufRead *.sh set filetype=sh
au BufRead *.haml set filetype=haml

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/


" start Airline
set laststatus=2
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#fnamemod = ':t'
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''





" Projectionist
let g:projectionist_heuristics = {
      \    "manifests/*.pp": {
      \     "type": "spec",
      \     "alternate": "spec/*/{}.rb"
      \   },
      \    "spec/*_spec.rb": {
      \     "type": "spec",
      \     "alternate": "spec/defines/{}.rb"
      \   }
      \ }


" set the 80 coloumn line
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" center after motion
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

no <DOWN> ddp
no <UP> ddkP



" SnipMate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'



let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_disable_autoinstall = 1


" ruby completions
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1



" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_min_syntax_length = 3 " 3 chars before pops up
let g:neocomplcache_enable_auto_select = 0



" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:molokai_original = 1



" Leader Command Section
let mapleader = ","


nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <Leader>rr :!ruby % <CR>


" Tabularize frequent matches
map <Leader>cu :Tabularize /\|<CR>
map <Leader>ce :Tabularize /=<CR>
map <Leader>cp :Tabularize /=><CR>


" quick buffer movement
noremap <Leader>n :bnext <CR>
noremap <Leader>p :bprev <CR>
nnoremap <Leader>ll :ls <CR>

" quicksave
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
nnoremap <leader>qq :q! <cr>
" quitck quit
nnoremap <leader>q :q<cr>
" switch from horizontal to vertical
nnoremap <leader>sh  <C-w>H  <cr>
" switch from vertical to horizontal
nnoremap <leader>sv  <C-w>K  <cr>

" suppert for ansible isn't in neomake as of yet this is a hack

nnoremap <leader>al :!ansible-lint % <cr>

" quickly open up my vimrc
nnoremap <leader>v :sp ~/.config/nvim/init.vim  <cr>

" Go syntax 
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gr <Plug>(go-run-split)


" make ctrlp use ag way faster
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0


" Neomake Config
autocmd! BufWritePost * Neomake


" function to merge tabs it's actually kinda useful
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <leader>mt :call MergeTabs()<CR>


hi link yamlDirective Function 
hi link yamlDocumentHeader Function 

nnoremap <leader>t :CtrlPTag<cr>

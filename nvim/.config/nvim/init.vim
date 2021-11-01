filetype plugin indent on


set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set completeopt=menu,menuone,noselect

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

call plug#begin('~/.config/.nvim/plugged')
set nocompatible              " be iMproved, required

filetype off                  " required

Plug 'AndrewRadev/splitjoin.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'google/vim-jsonnet'

Plug 'lifepillar/pgsql.vim'

Plug 'jvirtanen/vim-hcl'

Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'rust-lang/rust.vim'

" status bar
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons'

Plug 'hashivim/vim-hashicorp-tools'

Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'gioele/vim-autoswap'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'chase/vim-ansible-yaml'
Plug 'airblade/vim-gitgutter'
Plug 'lifepillar/vim-solarized8'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jremmen/vim-ripgrep'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" fuzzy finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'derekwyatt/vim-scala'
Plug 'tmux-plugins/vim-tmux'
Plug 'majutsushi/tagbar'
Plug 'elorest/vim-slang'
Plug 'racer-rust/vim-racer'
Plug 'chr4/nginx.vim'
Plug 'dense-analysis/ale'
Plug 'idanarye/vim-merginal'
Plug  'klen/python-mode'
Plug 'towolf/vim-helm'
Plug 'google/vim-maktaba'
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

nnoremap <SPACE> <Nop>

" Leader Command Section
let mapleader = " "

" fix the terminal
tnoremap <Esc> <C-\><C-n>

syntax on
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans = 1


colo solarized8

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
nnoremap <C-G> :set paste norelativenumber nonumber <Return>
nnoremap <C-N> :set nopaste relativenumber number<Return>


" navigation (from http://statico.github.com/vim.html)
" go up and down one row, not one line (useful for wrapped lines)
nnoremap j gj
nnoremap k gk

" center after motion
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz



nnoremap <DOWN> ddp
nnoremap <UP> ddkP


" Remove all whitespace
noremap <Leader>rw :%s/\s\+//g <CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Tabularize frequent matches
nnoremap <Leader>cu :Tabularize /\|<CR>
nnoremap <Leader>ce :Tabularize /=<CR>
nnoremap <Leader>cp :Tabularize /=><CR>

"Git
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gb :Git blame<CR>

" quick buffer movement
nnoremap <Leader>bn :bnext <CR>
nnoremap <Leader>bp :bprev <CR>

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
"files
nnoremap <leader>sp :Rg<Space>
"resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"Tags
nnoremap <leader>rt :silent ! ctags -R  --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) <cr>

nnoremap <leader>al :!ansible-lint % <cr>

" quickly open up my vimrc
nnoremap <leader>v :sp ~/.config/nvim/init.vim  <cr>


if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

nmap <leader>ps :call TrimWhitespace()<CR>

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

" hi link goVarDefs Underlined

let g:sql_type_default = 'pgsql'

" terraform vim config
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" rust settings
let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = "/Users/mleone/.cargo/bin/racer"

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

augroup Mleonidas
    autocmd!
    autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
    autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
    autocmd BufWritePre *.go lua goimports(1000)
augroup END



map <Leader>rrt :call RunCurrentSpecFile()<CR>
map <Leader>rra :call RunAllSpecs()<CR>

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
highlight clear SignColumn

" set the 80 coloumn line
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" set popup menu colors
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE


" lsp config
lua require("mleonidas")

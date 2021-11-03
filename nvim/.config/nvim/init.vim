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



" language plugins
Plug 'google/vim-jsonnet'
Plug 'lifepillar/pgsql.vim'
Plug 'jvirtanen/vim-hcl'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
Plug 'chase/vim-ansible-yaml'
Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug  'klen/python-mode'
Plug 'racer-rust/vim-racer'
Plug 'towolf/vim-helm'
Plug 'chr4/nginx.vim'

" status bar
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons'


Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'lifepillar/vim-solarized8'
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
Plug 'tmux-plugins/vim-tmux'
Plug 'majutsushi/tagbar'
Plug 'elorest/vim-slang'
Plug 'dense-analysis/ale'
Plug 'idanarye/vim-merginal'
Plug 'google/vim-maktaba'
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'mbbill/undotree'

" nvim autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" merge tabs
nnoremap <leader>mt :call MergeTabs()<CR>

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

" quickfix and location list mappings
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

" delete all trailing whitespace
nnoremap <leader>ps :call TrimWhitespace()<CR>

"Tags
nnoremap <leader>rt :silent ! ctags -R  --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) <cr>

nnoremap <leader>al :!ansible-lint % <cr>

" quickly open up my vimrc
nnoremap <leader>v :sp ~/.config/nvim/init.vim  <cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


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


let g:sql_type_default = 'pgsql'

augroup Mleonidas
    autocmd!
    autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
    autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
    autocmd BufWritePre *.go lua goimports(1000)
augroup END


" set the 80 coloumn line
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif


" lsp config
lua require("mleonidas")

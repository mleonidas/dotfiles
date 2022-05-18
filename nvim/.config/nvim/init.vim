filetype plugin indent on

syntax on

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set completeopt=menu,menuone,noselect

call plug#begin('~/.config/.nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

Plug 'jjo/vim-cue'

" language plugins
Plug 'google/vim-jsonnet'
Plug 'lifepillar/pgsql.vim'
Plug 'jvirtanen/vim-hcl'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'

Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'towolf/vim-helm'
Plug 'chr4/nginx.vim'

" status bar
Plug 'NTBBloodbath/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons'

Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'lifepillar/vim-solarized8'
Plug 'ishan9299/nvim-solarized-lua'

" some git things NOTE: vim-fugitive is a git plugin listed in tpopes section
Plug 'pwntester/octo.nvim'
Plug 'airblade/vim-gitgutter'

" Go plugin
Plug 'ray-x/go.nvim'

Plug 'godlygeek/tabular'
Plug 'jremmen/vim-ripgrep'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'

" http nvim plugin
Plug 'NTBBloodbath/rest.nvim'

" refactoring tool
Plug 'ThePrimeagen/refactoring.nvim'

" obligatory tpope plugins
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'f-person/git-blame.nvim'

" vim marks on steroids
Plug 'ThePrimeagen/harpoon'

" fuzzy finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-raw.nvim'

" markdown
Plug 'ellisonleao/glow.nvim'

Plug 'google/vim-maktaba'
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
'
Plug 'mbbill/undotree'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'

" nvim autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Plug 'tjdevries/colorbuddy.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'

" Treesitter setups
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Dap setups
Plug 'sebdah/vim-delve'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
Plug 'nvim-telescope/telescope-dap.nvim'

" hopefully this is useful
Plug 'folke/todo-comments.nvim'





call plug#end()

nnoremap <SPACE> <Nop>
" Leader Command Section
let mapleader = " "

set background=dark

colo solarized

" fix the terminal
tnoremap <Esc> <C-\><C-n>

" make Y behave like other capitols
nnoremap Y y$

" iterm2 things ctrl-h is BS
if has('nvim')
     nnoremap <BS> <C-W>h
endif


lua require("mleonidas")

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

nnoremap <Leader>rp :resize 100<CR>

" Tabularize frequent matches
nnoremap <Leader>cu :Tabularize /\|<CR>
nnoremap <Leader>ce :Tabularize /=<CR>
nnoremap <Leader>cp :Tabularize /=><CR>

" quick buffer movement
nnoremap <Leader>bn :bnext <CR>
nnoremap <Leader>bp :bprev <CR>

"files
" nnoremap <leader>ps :Rg<Space>

"resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winheight(0) * 2/3)<CR>


" resive vertical


" delete all trailing whitespace
nnoremap <leader>ps :call TrimWhitespace()<CR>

" quickly open up my vimrc
nnoremap <leader>v :sp ~/.config/nvim/init.vim  <cr>


" show syntax symbols
nnoremap <leader>gm :call SynStack()<CR>

" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

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


" set the 80 coloumn line
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

let g:gitblame_enabled = 0

lua <<EOF
require("todo-comments").setup{}
EOF

augroup Mleonidas
    autocmd!
    au FileType * hi ExtraWhitespace ctermbg=red guibg=red
    autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
    au FileType * hi link CmpItemKind Function 
    au FileType *.env setlocal commentstring=#\ %s
augroup END



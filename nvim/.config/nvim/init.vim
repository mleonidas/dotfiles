filetype plugin indent on

" Leader Command Section
let mapleader = " "

" iterm2 things ctrl-h is BS
if has('nvim')
     nnoremap <BS> <C-W>h
endif

lua require('mleonidas')

" use 256 colors in terminal
if !has("gui_running")
  set t_Co=256
endif

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

augroup Mleonidas
    autocmd!
    au FileType *.env setlocal commentstring=#\ %s
augroup END

augroup neoformat
    autocmd!
    autocmd BufWritePre *.py Neoformat
augroup END

let g:better_whitespace_filetypes_blacklist=['neogitstatus', 'NeogitCommitMessage', 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']

let g:neoformat_enabled_python = ['black', 'isort', 'flake8']
let g:neoformat_run_all_formatters = 1
let test#python#runner = 'djangotest'

let g:sql_type_default = 'pgsql'
let g:gitblame_enabled = 0


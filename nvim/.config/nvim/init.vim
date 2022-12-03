filetype plugin indent on


nnoremap <SPACE> <Nop>

" Leader Command Section
let mapleader = " "

" fix the terminal
tnoremap <Esc> <C-\><C-n>

" make Y behave like other capitols
nnoremap Y y$

" iterm2 things ctrl-h is BS
if has('nvim')
     nnoremap <BS> <C-W>h
endif

lua require('mleonidas')

nnoremap <DOWN> ddp
nnoremap <UP> ddkP

nnoremap <Leader>rp :resize 100<CR>

"resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winheight(0) * 2/3)<CR>

" quickly open up my vimrc
nnoremap <leader>v :sp ~/.config/nvim/init.vim  <cr>

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


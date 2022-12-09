filetype plugin indent on

lua require("globals")
lua require('mleonidas')

augroup Mleonidas
    autocmd!
    au FileType *.env setlocal commentstring=#\ %s
    au TermOpen,BufWinEnter,WinEnter term://* DisableWhitespace
augroup END

augroup neoformat
    autocmd!
    autocmd BufWritePre *.py Neoformat
augroup END

let g:better_whitespace_filetypes_blacklist=['neogitstatus', 'NeogitCommitMessage', 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive', 'terminal']
let g:neoformat_enabled_python = ['black', 'isort', 'flake8']
let g:neoformat_run_all_formatters = 1
let test#python#runner = 'djangotest'
let g:sql_type_default = 'pgsql'
let g:gitblame_enabled = 0



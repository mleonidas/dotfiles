filetype plugin indent on

lua require("globals")
lua require('mleonidas')

let g:better_whitespace_filetypes_blacklist=['neogitstatus', 'NeogitCommitMessage', 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive', 'terminal']
let g:neoformat_enabled_python = ['black', 'isort', 'flake8']
let g:neoformat_run_all_formatters = 1
let test#python#runner = 'djangotest'
let g:sql_type_default = 'pgsql'
let g:gitblame_enabled = 0

" terraform vim config
let g:terraform_align=1
let g:terraform_fmt_on_save=1

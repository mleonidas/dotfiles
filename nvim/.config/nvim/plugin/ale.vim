let g:ale_disable_lsp = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'go': ['revive'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'javascript': ['eslint', 'prettier'],
    \    'python': ['black']
    \}



let g:ale_fix_on_save = 1

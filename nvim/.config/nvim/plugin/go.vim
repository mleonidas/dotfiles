" Go plugin settings
let g:go_highlight_functions = 1
let g:go_imports_mode = 0
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_disable_autoinstall = 1
let g:go_term_enabled = 1
let g:go_term_reuse = 1
let g:go_term_mode = "split"
let g:go_term_height = 20
let g:go_metalinter_command = "golangci-lint"

augroup Golang
    autocmd!
    " Go syntax
    "
    autocmd BufWritePost *.go lua vim.lsp.buf.formatting()
    autocmd BufWritePost *.go lua goimports(1000) 
    au FileType go nmap <Leader>gi <Plug>(go-info)
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>ds <Plug>(go-def-split)
    au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dt <Plug>(go-def-tab)
    au FileType go nmap <Leader>gr <Plug>(go-run-split)
    au FileType go nmap <Leader>gt <Plug>(go-test)
    au FileType GOTERM set nonumber norelativenumber 

    " change the default red to violet
    au FileType go hi! link goVarDefs Underlined
    " make nil magenta
    au FileType go hi! link goPredefinedIdentifiers Todo
    au FileType go hi! link goParamName Underlined
    " au FileType go hi! link goParamType Type

augroup END

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
    autocmd BufWritePre *.go :silent lua vim.lsp.buf.formatting_sync(nil, 3000)
    autocmd BufWritePre *.go :silent lua org_imports(1000) 

    au FileType go nmap <Leader>gr <Plug>(go-run-split)
    au FileType go nmap <Leader>gt <Plug>(go-test)
    au FileType GOTERM set nonumber norelativenumber 
augroup END



" hi TSFunction  
" hi TSConstant 
" hi TSConstructor 
" hi TSConditional
" hi TSNumber 
" hi TSOperator 
" hi TSParameter 
" hi TSParameterReference 
" hi TSProperty 
" hi TSField 
" hi TSPunctDelimiter 
" hi TSPunctBracket 
" hi TSPunctSpecial 
" hi TSRepeat 
" hi TSString
" hi TSType 
" hi TSTypeBuiltin 
" hi TSVariable 
" hi TSVariableBuiltin 
" hi TSFloat 
" hi TSKeywordOperator 
" hi TSKeywordFunction 
" hi TSKeywordReturn 
" hi TSMethod 
" hi TSNamespace 
" hi TSException 
" hi TSInclude 
" hi TSTag 
" hi TSTagCustom 
" hi TSTagDelimiter 
" hi TSTagAttribute
" hi TSStatement 
" hi TSError 

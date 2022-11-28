augroup Golang
    autocmd!
    " Go syntax
    autocmd BufWritePre *.go :silent lua vim.lsp.buf.formatting_sync(nil, 3000)
    autocmd BufWritePre *.go :silent lua org_imports(1000)

    au FileType go nmap <Leader>gr <Plug>(go-run-split)
    au FileType go nmap <Leader>gt <Plug>(go-test)
    au FileType GOTERM set nonumber norelativenumber
augroup END

augroup Rustlang
     autocmd!
     autocmd BufWritePre *.rs :silent lua vim.lsp.buf.format(nil, 3000)
augroup END

augroup LspFormat
    autocmd!
    autocmd BufWritePre *.py  NullFormat
    autocmd BufWritePre *.lua NullFormat
    autocmd BufWritePre *.ts  NullFormat
    autocmd BufWritePre *.tsx NullFormat
    autocmd BufWritePre *.go  NullFormat
    autocmd BufWritePre *.js  NullFormat
augroup END

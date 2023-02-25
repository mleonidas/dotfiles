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

augroup Authzed
  au!
  autocmd BufNewFile,BufRead *.authzed set ft=authzed
  autocmd BufNewFile,BufRead *.zed set ft=authzed
  autocmd BufNewFile,BufRead *.azd set ft=authzed
augroup END


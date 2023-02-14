augroup Rustlang
     autocmd!
     autocmd BufWritePre *.rs :silent lua vim.lsp.buf.format(nil, 3000)
augroup END

augroup LspFormat
    autocmd!
    autocmd BufWritePre * undojoin | NullFormat
augroup END

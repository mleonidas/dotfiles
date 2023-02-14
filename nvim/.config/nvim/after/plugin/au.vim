augroup Rustlang
     autocmd!
     autocmd BufWritePre *.rs :silent lua vim.lsp.buf.formatting_sync(nil, 3000)
augroup END

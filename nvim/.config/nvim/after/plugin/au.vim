augroup Authzed
  au!
  autocmd BufNewFile,BufRead *.authzed set ft=authzed
  autocmd BufNewFile,BufRead *.zed set ft=authzed
  autocmd BufNewFile,BufRead *.azd set ft=authzed
augroup END

" augroup LspBuf
"   au!
"   autocmd User lsp_setup call lsp#register_server({
"       \ 'name': 'bufls',
"       \ 'cmd': {server_info->['bufls', 'serve']},
"       \ 'whitelist': ['proto'],
"       \ })
"   autocmd FileType proto nmap <buffer> gd <plug>(lsp-definition)
" augroup END
"

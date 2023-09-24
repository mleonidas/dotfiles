augroup Authzed
  au!
  autocmd BufNewFile,BufRead *.zed set ft=zed
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

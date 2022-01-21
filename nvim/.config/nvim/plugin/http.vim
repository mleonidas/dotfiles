"" map some functions to lua 
" nnoremap <Plug>RestNvim :lua require('rest-nvim').run()<CR>
" nnoremap <Plug>RestNvimPreview :lua require('rest-nvim').run(true)<CR>
" nnoremap <Plug>RestNvimLast :lua require('rest-nvim').last()<CR>
"
"
"
augroup RestHttp 
    autocmd!
    au FileType http nmap <Leader>rnn <Plug>RestNvim :lua require('rest-nvim').run()<CR>
augroup END





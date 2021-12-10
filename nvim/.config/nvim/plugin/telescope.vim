
lua << EOF
require('telescope').setup{}
EOF

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true, previewer=false})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files({previewer=false})<CR>

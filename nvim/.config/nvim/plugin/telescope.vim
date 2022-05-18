
lua << EOF
require('telescope').setup{}
require('telescope').load_extension('live_grep_raw')
EOF

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true, previewer=false})<cr>
nnoremap <leader>fg <cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<cr>
nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files({previewer=false})<CR>

nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

nnoremap <leader>ctt :TodoTelescope<CR>
nnoremap <leader>xt :TodoTrouble<CR>

nnoremap <leader>am :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>


" quick navigation of added files
nnoremap <leader>a :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>s :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>d :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>f :lua require("harpoon.ui").nav_file(4)<CR>

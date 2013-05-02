"status line awesomeness
set laststatus=2
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
syntax on

"autorelad conf
autocmd! bufwritepost .vimrc source %


" remap max splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

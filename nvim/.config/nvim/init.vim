filetype plugin indent on
let test#python#runner = 'djangotest'
lua require("globals")
lua require('mleonidas')

" Inform vim how to enable undercurl in wezterm
let &t_Cs = "\e[60m"
" Inform vim how to disable undercurl in wezterm (this disables all underline modes)
let &t_Ce = "\e[24m"

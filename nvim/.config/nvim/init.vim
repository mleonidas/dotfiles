filetype plugin indent on
let test#python#runner = 'djangotest'
lua require("globals")
lua require('mleonidas')
" Inform vim how to enable undercurl in wezterm
let &t_Cs = "\e[60m"
" Inform vim how to disable undercurl in wezterm (this disables all underline modes)
let &t_Ce = "\e[24m"

lua <<EOF
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
EOF

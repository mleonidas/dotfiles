local nnoremap = require("mleonidas.keymap").nnoremap
local silent = { silent = true }

nnoremap("<Leader>dtb", ":DlvToggleBreakpoint<CR>", silent)
nnoremap("<Leader>tb", ":GoBreakToggle<CR>", silent)
vim.api.nvim_set_var("devle_new_command", "new")

local nnoremap = require("mleonidas.keymap").nnoremap

local silent = { silent = true }

-- git remaps
nnoremap("<Leader>gs", ":Git<cr>", silent)
nnoremap("<Leader>gB", ":GitBlameToggle<cr>", silent)
nnoremap("<Leader>gitph", ":Git push origin HEAD<cr>", silent)
nnoremap("<Leader>gfa", ":Git fetch --all<cr>", silent)
nnoremap("<Leader>grom", ":Git rebase origin/master<cr>", silent)
nnoremap("<Leader>gl", ":Git log<cr>", silent)
nnoremap("<Leader>gf",  ":diffget//2<cr>", silent)
nnoremap("<Leader>gj", ":diffget//3<cr>", silent)

-- keymap("n", "<Leader>gs", ":Neogit<CR>", opts)


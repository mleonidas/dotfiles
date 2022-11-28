local nnoremap = require("mleonidas.keymap").nnoremap

local silent = { silent = true }

-- Tabularize frequent matches
nnoremap("<Leader>cu", ':Tabularize /|<CR>', silent)
nnoremap("<Leader>ce", ":Tabularize /=<CR>", silent)
nnoremap("<Leader>cp", ":Tabularize /=><CR>", silent)

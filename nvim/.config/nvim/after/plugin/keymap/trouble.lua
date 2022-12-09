require("trouble").setup()

local nnoremap = require("mleonidas.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>", silent)
nnoremap("<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", silent)
nnoremap("<leader>xd,", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", silent)
nnoremap("<leader>xq,", "<cmd>TroubleToggle quickfix<cr>", silent)
nnoremap("<leader>xl",  "<cmd>TroubleToggle loclist<cr>", silent)

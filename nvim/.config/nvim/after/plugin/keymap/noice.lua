local nnoremap = require("mleonidas.keymap").nnoremap

local silent = { silent = true }

-- quick navigation of added files

nnoremap("<Leader>nsh", ":NoiceHistory<cr>", silent)
nnoremap("<Leader>nam", ":NoiceDismiss<cr>", silent)

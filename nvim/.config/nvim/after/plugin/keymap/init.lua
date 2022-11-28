require('refactoring').setup({})

local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

-- Toggle line numbers and paste
keymap("n", "<C-G>", ":set paste norelativenumber nonumber<CR>", opts)
keymap("n", "<C-N>", ":set nopaste relativenumber number<CR>",opts)


-- refactoring plugin remaps
keymap("v", "<leader>tre", ":lua require('telescope').extensions.refactoring.refactors()<CR>", opts)

-- Octo bindings
keymap("n", "<Leader>gopr", ":Octo pr list<CR>", opts)

-- navigation mappings
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- center after motion
keymap("n", "G", "Gzz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "}", "}zz", opts)
keymap("n", "{", "{zz", opts)

--  quick buffer movement
keymap("n", "<Leader>bn", ":bnext <CR>", opts)
keymap("n", "<Leader>bp", ":bprev <CR>", opts)

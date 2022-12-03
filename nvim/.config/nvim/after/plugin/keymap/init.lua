require('refactoring').setup({})

local keymap = vim.keymap.set
local Remap = require("mleonidas.keymap")
local nnoremap = Remap.nnoremap
-- local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
-- Silent keymap option
local opts = { noremap = true, silent = true }
local silent = { silent = true }

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

-- Toggle line numbers and paste
nnoremap("<C-G>", ":set paste norelativenumber nonumber<CR>")
nnoremap("<C-N>", ":set nopaste relativenumber number<CR>")

-- Trim trailing whitespace
nnoremap("<leader>ds", ":lua require('mleonidas.trim').trail()<CR>")

-- refactoring plugin remaps
vnoremap("<leader>tre", ":lua require('telescope').extensions.refactoring.refactors()<CR>")

-- Octo bindings
nnoremap("<Leader>gopr", ":Octo pr list<CR>")

-- navigation mappings
nnoremap("j", "gj")
nnoremap("k", "gk")

-- center after motion
nnoremap("G", "Gzz")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")
nnoremap("}", "}zz")
nnoremap("{", "{zz")

--  quick buffer movement
nnoremap("<Leader>bn", ":bnext <CR>")
nnoremap("<Leader>bp", ":bprev <CR>")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")

nnoremap('<A-r>', ":lua require('smart-splits').start_resize_mode()<CR>")


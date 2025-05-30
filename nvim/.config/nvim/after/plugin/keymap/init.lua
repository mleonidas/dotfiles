require("refactoring").setup({})

local keymap = vim.keymap.set
local Remap = require("mleonidas.keymap")
local nnoremap = Remap.nnoremap
-- local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap

-- Silent keymap option
local opts = { noremap = true, silent = true }
local silent = { silent = true }

keymap("", "<Space>", "<Nop>", opts)

-- Toggle line numbers and paste
nnoremap("<Leader>tn", ":set paste norelativenumber nonumber<CR>")
nnoremap("<Leader>tg", ":set nopaste relativenumber number<CR>")

-- Trim trailing whitespace
nnoremap("<leader>ds", ":lua require('mleonidas.trim').trail()<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- keep cursor in place while jumping
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- keep search terms in middle
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- refactoring plugin remaps
vnoremap("<leader>tre", ":lua require('telescope').extensions.refactoring.refactors()<CR>")

-- Octo bindings
nnoremap("<Leader>gopr", ":Octo pr list<CR>")
nnoremap("<Leader>lsf", ":lua vim.lsp.buf.format()<cr>")

-- navigation mappings
nnoremap("j", "gj")
nnoremap("k", "gk")

-- make Y behave like other capitols
nnoremap("Y", "y$")

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
xnoremap("<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

nnoremap("<Leader>_", function()
	require("smart-splits").resize_down()
end, silent)

nnoremap("<A-r>", function()
	require("smart-splits").start_resize_mode()
end, silent)

nnoremap("<Leader>+", require("smart-splits").resize_up)
nnoremap("<Leader><", require("smart-splits").resize_left)
nnoremap("<Leader>>", require("smart-splits").resize_right)
nnoremap("<Leader>rp", ":resize 100<CR>")
nnoremap("<Leader>o", "<cmd>Telescope neoclip<CR>")
nnoremap("-", "<CMD>Oil<CR>")

-- nnoremap("<DOWN>", "ddp")
-- nnoremap("<UP>", "ddkP")

-- fix the terminal
tnoremap("<Esc>", "<C-\\><C-n>")

nnoremap("<Leader>tt", ":ToggleTerm<CR>")
nnoremap("<Leader>gtt", ":GoAlt<CR>")
nnoremap("<Leader>gtf", ":GoTestFunc<CR>")

if vim.fn.has("nvim") then
	nnoremap("<BS>", "<C-W>h")
end

vnoremap("<leader>s1", '<cmd>lua require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })<cr>', silent)

-- setup copilot override since tab is used in cmp
vim.g.copilot_no_tab_map = true
vim.cmd([[imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")]])

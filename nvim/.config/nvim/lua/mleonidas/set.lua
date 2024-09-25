-- Ignore compiled files
vim.opt.wildignore = "*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/.git/*,Cargo.lock,__pycache__"
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.background = "dark"

vim.opt.encoding = "utf-8"
vim.opt.background = "dark"

vim.opt.fileencoding = "utf-8"
vim.opt.et = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.colorcolumn = "100"

vim.opt.mouse = "n"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.opt.laststatus = 3
vim.opt.cursorline = true

vim.opt.fillchars.vert = "vert:│"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.syntax = "enable"

-- use 256 colors in terminal
if not vim.fn.has("gui_running") then
	vim.opt.t_Co = 256
end

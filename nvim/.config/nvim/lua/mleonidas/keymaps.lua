require('telescope').setup{}
require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('git_worktree')
require("telescope").load_extension("refactoring")
require('refactoring').setup({})

local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "


-- Toggle line numbers and paste
keymap("n", "<C-G>", ":set paste norelativenumber nonumber<CR>", opts)
keymap("n", "<C-N>", ":set nopaste relativenumber number<CR>",opts)


-- telescope mappings
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true, previewer=false})<cr>",opts)
keymap("n","<leader>fg", '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>',opts)
keymap("n","<leader>bb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n","<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n","<leader>gb", ":lua require('telescope.builtin').git_branches()<cr>", opts)
keymap("n","<leader>tr", ":Telescop registers<cr>", opts)
keymap("n", "<C-p>", ":lua require('telescope.builtin').git_files({previewer=false})<CR>", opts)
keymap("n", "<leader>gm", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)
keymap("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
keymap("n", "<leader>ctt",":TodoTelescope<CR>", opts)
keymap ("n", "<leader>xt", ":TodoTrouble<CR>", opts)

-- refactoring plugin remaps
keymap("v", "<leader>tre", ":lua require('telescope').extensions.refactoring.refactors()<CR>", opts)

-- git remaps
keymap("n",  "<Leader>gs",  ":Git<CR>", opts)
keymap("n", "<Leader>gB", ":GitBlameToggle<CR>", opts)
keymap("n", "<Leader>gitph", ":Git push origin HEAD<CR>", opts)
keymap("n", "<Leader>gfa", ":Git fetch --all<CR>", opts)
keymap("n", "<Leader>grom", ":Git rebase origin/master<CR>", opts)
keymap("n", "<Leader>gl", ":Git log<CR>", opts)
keymap("n", "<Leader>gf",  ":diffget//2<CR>", opts)
keymap("n", "<Leader>gj", ":diffget//3<CR>", opts)

-- keymap("n", "<Leader>gs", ":Neogit<CR>", opts)
keymap("n", "<Leader>gB", ":GitBlameToggle<CR>", opts)

-- Octo bindings
keymap("n", "<Leader>gopr", ":Octo pr list<CR>", opts)

-- harpoon
keymap("n", "<leader>ma", ':lua require("harpoon.mark").add_file()<CR>', opts)
keymap("n",  "<C-e>",  ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", "<leader>tc", ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)

-- quick navigation of added files
keymap("n", "<leader>a", ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap("n", "<leader>s", ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap("n", "<leader>d", ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap("n", "<leader>f", ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

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

-- Tabularize frequent matches
keymap("n", "<Leader>cu", ':Tabularize /|<CR>', opts)
keymap("n", "<Leader>ce", ":Tabularize /=<CR>", opts)
keymap("n", "<Leader>cp", ":Tabularize /=><CR>", opts)


require('telescope').setup{}
require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('git_worktree')
require("telescope").load_extension("refactoring")

local nnoremap = require("mleonidas.keymap").nnoremap

local silent = { silent = true }

-- telescope mappings
nnoremap("<leader>ff", function() require('telescope.builtin').find_files({hidden=true, previewer=false}) end, silent)
nnoremap("<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end, silent)
nnoremap("<leader>bb", function() require('telescope.builtin').buffers() end, silent)
nnoremap("<leader>fh", function() require('telescope.builtin').help_tags() end, silent)
nnoremap("<leader>gb", function() require('telescope.builtin').git_branches() end, silent)
nnoremap("<leader>tr", ":Telescope registers<cr>", silent)
nnoremap("<C-p>", function() require('telescope.builtin').git_files({previewer=false}) end, silent)
nnoremap("<leader>gm", function() require('telescope').extensions.git_worktree.create_git_worktree() end, silent)
nnoremap("<leader>gw", function() require('telescope').extensions.git_worktree.git_worktrees() end, silent)
nnoremap("<leader>ctt",":TodoTelescope<cr>", silent)
nnoremap("<leader>xt", ":TodoTrouble<cr>", silent)

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

local nnoremap = require("mleonidas.keymap").nnoremap

local silent = { silent = true }

-- harpoon
nnoremap("<leader>ma", function()
	require("harpoon.mark").add_file()
end, silent)
nnoremap("<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, silent)
nnoremap("<leader>tc", function()
	require("harpoon.cmd-ui").toggle_quick_menu()
end, silent)

-- quick navigation of added files
nnoremap("<leader>a", function()
	require("harpoon.ui").nav_file(1)
end, silent)
nnoremap("<leader>s", function()
	require("harpoon.ui").nav_file(2)
end, silent)
nnoremap("<leader>d", function()
	require("harpoon.ui").nav_file(3)
end, silent)
nnoremap("<leader>f", function()
	require("harpoon.ui").nav_file(4)
end, silent)

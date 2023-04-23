local nmap = require("mleonidas.keymap").nmap
local silent = { silent = true }

nmap("cz", function()
	require("mleonidas.term").git_commit_toggle()
end, silent)

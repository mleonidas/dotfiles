local Worktree = require("git-worktree")

local function file_exists(filename)
	local file = io.open(filename, "r")
	if file then
		-- Obviously close the file if it did successfully open.
		file:close()
		return true
	end
	return false
end

Worktree.on_tree_change(function(op, metadata)
	if op == Worktree.Operations.Switch then
		if file_exists(".envrc") then
			print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
			local handle = io.popen([["direnv allow ."]])
			if handle == nil then
				print("direnv allow . failed")
				return
			end
			local result = handle:read("*a")
			local ok, _, _ = handle:close()
			if ok then
				print("direnv allow .")
				print(result)
			else
				print("direnv allow . failed")
			end
		end
	end
end)

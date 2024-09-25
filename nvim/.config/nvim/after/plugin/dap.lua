local dap, dapui = require("dap"), require("dapui")
local dapgo = require("dap-go")

local function get_arguments()
	local co = coroutine.running()
	if co then
		return coroutine.create(function()
			local args = {}
			vim.ui.input({ prompt = "Enter command-line arguments: " }, function(input)
				args = vim.split(input, " ")
			end)
			coroutine.resume(co, args)
		end)
	else
		local args = {}
		vim.ui.input({ prompt = "Enter command-line arguments: " }, function(input)
			args = vim.split(input, " ")
		end)
		return args
	end
end

dapui.setup()
-- dapgo.setup({
-- 	dap_configurations = {
-- 		{
-- 			type = "go",
-- 			name = "Debug with arguments",
-- 			request = "launch",
-- 			mode = "debug",
-- 			program = "${workspaceFolder}/cmd/server",
-- 			args = get_arguments,
-- 		},
-- 	},
-- })
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

-- Include the next few lines until the comment only if you feel you need it
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
-- Include everything after this
--
vim.keymap.set("n", "<space>?", function()
	require("dapui").eval(nil, { enter = true })
end)
vim.keymap.set("n", "<leader>q", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F12>", dap.restart)
vim.keymap.set("n", "<F11>", dap.close)

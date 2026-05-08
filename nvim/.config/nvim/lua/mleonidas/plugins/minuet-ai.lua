return {
	"milanglacier/minuet-ai.nvim",
	event = "InsertEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("minuet").setup({
			provider = "openai",
			provider_options = {
				openai = {
					model = "gpt-4o-mini",
					api_key = "OPENAI_API_KEY",
				},
			},
			virtualtext = {
				auto_trigger_ft = { "go", "lua", "python", "typescript", "rust" },
				keymap = {
					-- accept whole completion
					accept = "<Tab>",
					-- accept one line
					accept_line = "<A-a>",
					-- accept n lines (prompts for number)
					-- e.g. "A-z 2 CR" will accept 2 lines
					accept_n_lines = "<A-z>",
					-- Cycle to prev completion item, or manually invoke completion
					prev = "<A-[>",
					-- Cycle to next completion item, or manually invoke completion
					next = "<A-]>",
					dismiss = "<A-e>",
				},
			},
		})
	end,
}

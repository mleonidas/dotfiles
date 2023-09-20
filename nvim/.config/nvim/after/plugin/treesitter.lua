if not pcall(require, "nvim-treesitter") then
	print("Warning: treesitter not available, skipping configuration.")
	return
end

local ts_configs = require("nvim-treesitter.configs")
-- local ts_parsers = require("nvim-treesitter.parsers")

local parsers_to_install = {
	"python",
	"go",
	"json",
	"http",
	"ruby",
	"sql",
	"graphql",
	"go",
	"rust",
	"cue",
	"jq",
	"json",
	"yaml",
	"nix",
	"regex",
	"gomod",
	"gosum",
	"gowork",
	"graphql",
	"bash",
	"comment",
	"proto",
	"hcl",
	"make",
	"dockerfile",
	"gitcommit",
	"gitignore",
	"gitattributes",
	"git_rebase",
	"git_config",
	"typescript",
}

if vim.fn.has("mac") > 0 then
	-- Disable 'dockerfile' until nvim-treesitter/nvim-treesitter#3515 is resolved
	parsers_to_install = vim.tbl_filter(function(x)
		return x ~= "dockerfile"
	end, parsers_to_install)
	pcall(function()
		require("nvim-treesitter.install").uninstall("dockerfile")
	end)
end

ts_configs.setup({
	ensure_installed = parsers_to_install,
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "c" }, -- list of language that will be disabled
	},

	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.authzed = {
	install_info = {
		url = "https://github.com/mleonidas/tree-sitter-authzed", -- local path or git repo
		files = { "src/parser.c" },
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
		-- optional entries:
		branch = "main", -- default branch in case of git repo if different from master
	},
	filetype = "zed", -- if filetype does not match the parser name
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- show hex colors
	"norcalli/nvim-colorizer.lua",
	-- better whitespace ? TODO(mleonidas): rewrite in lua
	"ntpeters/vim-better-whitespace",
	"folke/tokyonight.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	"benfowler/telescope-luasnip.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"christoomey/vim-tmux-navigator",
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	"tmux-plugins/vim-tmux",
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	"averms/black-nvim",
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		opts = {},
	},
	"mrjones2014/smart-splits.nvim",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- there's got to be a better way
	"vim-test/vim-test",
	"godlygeek/tabular",
	"numToStr/Comment.nvim",
	"kyazdani42/nvim-web-devicons",
	"simrat39/rust-tools.nvim",
	"simrat39/symbols-outline.nvim",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"vim-crystal/vim-crystal",
	-- "github/copilot.vim",
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	"lukas-reineke/indent-blankline.nvim",
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- tpope plugins
	"tpope/vim-vinegar",
	"tpope/vim-dispatch",
	"tpope/vim-endwise",
	"tpope/vim-repeat",
	"tpope/vim-unimpaired",
	-- better git blame
	"f-person/git-blame.nvim",

	-- status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			-- { "zbirenbaum/copilot-cmp" },

			{
				"L3MON4D3/LuaSnip",
				version = "1.2.1",
				build = "make install_jsregexp",
			},
			-- {
			-- 	"codota/tabnine-nvim",
			-- 	build = "./dl_binaries.sh",
			-- },
		},
	},

	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- Primeagen doesn"t create lodash
	"ThePrimeagen/git-worktree.nvim",
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"folke/lsp-colors.nvim",
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	"nvim-treesitter/playground",
	"romgrk/nvim-treesitter-context",

	"leoluz/nvim-dap-go",
	"ldelossa/nvim-dap-projects",
	{ "rcarriga/nvim-dap-ui", dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	} },
	"sebdah/vim-delve",
	"folke/todo-comments.nvim",
	"mhartington/formatter.nvim",
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			-- you'll need at least one of these
			-- {'nvim-telescope/telescope.nvim'},
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup()
		end,
	},
})

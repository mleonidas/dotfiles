local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- rest client
	"NTBBloodbath/rest.nvim",

	-- show hex colors
	"chrisbra/Colorizer",
	-- better whitespace ? TODO(mleonidas): rewrite in lua
	"ntpeters/vim-better-whitespace",
	-- TJ created lodash of neovim
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-telescope/telescope.nvim",
	"benfowler/telescope-luasnip.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"AndrewRadev/splitjoin.vim",
	"christoomey/vim-tmux-navigator",
	"tmux-plugins/vim-tmux",
	"jjo/vim-cue",
	"LnL7/vim-nix",
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	"averms/black-nvim",
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	"mrjones2014/smart-splits.nvim",

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},

	-- there's got to be a better way
	"vim-test/vim-test",
	"godlygeek/tabular",
	"jremmen/vim-ripgrep",
	"numToStr/Comment.nvim",
	"tomtom/tlib_vim",
	"ekalinin/Dockerfile.vim",
	"earthly/earthly.vim",
	"towolf/vim-helm",
	"kyazdani42/nvim-web-devicons",
	"MarcWeber/vim-addon-mw-utils",
	"simrat39/rust-tools.nvim",
	"simrat39/symbols-outline.nvim",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"nvim-telescope/telescope-project.nvim",
	"folke/tokyonight.nvim",
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
	"tpope/vim-projectionist",
	"tpope/vim-repeat",
	"tpope/vim-unimpaired",
	-- better git blame
	"f-person/git-blame.nvim",

	-- status bar
	{
		"NTBBloodbath/galaxyline.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
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

			{
				"L3MON4D3/LuaSnip",
				version = "1.2.1",
				build = "make install_jsregexp",
			},

			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
				dependencies = "hrsh7th/nvim-cmp",
			},
		},
	},

	"folke/trouble.nvim",
	"nvim-lua/lsp_extensions.nvim",
	"glepnir/lspsaga.nvim",

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

	"nvim-treesitter/playground",
	"romgrk/nvim-treesitter-context",

	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",

	"sebdah/vim-delve",
	"leoluz/nvim-dap-go",
	"folke/todo-comments.nvim",
	"mhartington/formatter.nvim",

	"jose-elias-alvarez/null-ls.nvim",
	-- Github integration
	"pwntester/octo.nvim",
})

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
	-- show hex colors
	"chrisbra/Colorizer",
	-- better whitespace ? TODO(mleonidas): rewrite in lua
	"ntpeters/vim-better-whitespace",
	-- TJ created lodash of neovim
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"folke/tokyonight.nvim",
	"nvim-telescope/telescope.nvim",
	"benfowler/telescope-luasnip.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"christoomey/vim-tmux-navigator",
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	"navarasu/onedark.nvim",
	"tmux-plugins/vim-tmux",
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

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
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
	-- "ahmedkhalf/project.nvim",
	-- {
	-- 	"nvim-telescope/telescope-project.nvim",
	-- 	config = function()
	-- 		require("project_nvim").setup({})
	-- 	end,
	-- },
	"github/copilot.vim",
	{ "rose-pine/neovim", name = "rose-pine" },
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

	"folke/trouble.nvim",

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
	{ "rcarriga/nvim-dap-ui", dependencies = {
		"mfussenegger/nvim-dap",
	} },
	"sebdah/vim-delve",
	"folke/todo-comments.nvim",
	{
		"mleonidas/formatter.nvim",
		branch = "mleonidas/add-buf-support",
	},
	-- Github integration
	"pwntester/octo.nvim",
})

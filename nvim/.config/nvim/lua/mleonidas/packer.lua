vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")

    -- rest client
    use("NTBBloodbath/rest.nvim")

    -- show hex colors
    use("chrisbra/Colorizer")

    -- better whitespace ? TODO(mleonidas): rewrite in lua
    use("ntpeters/vim-better-whitespace")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-live-grep-args.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")

    use("AndrewRadev/splitjoin.vim")
    use("christoomey/vim-tmux-navigator")
    use("tmux-plugins/vim-tmux")
    use("jjo/vim-cue")
    use("LnL7/vim-nix")

    -- language plugins
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("averms/black-nvim")
    use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

    use('mrjones2014/smart-splits.nvim')

    -- there's got to be a better way
    use("vim-test/vim-test")

    use("ray-x/go.nvim")
    use("godlygeek/tabular")
    use("jremmen/vim-ripgrep")
    use("numToStr/Comment.nvim")
    use("tomtom/tlib_vim")
    use("lifepillar/pgsql.vim")
    use("ekalinin/Dockerfile.vim")
    use("earthly/earthly.vim")
    use("towolf/vim-helm")
    use("kyazdani42/nvim-web-devicons")
    use("MarcWeber/vim-addon-mw-utils")
    use('simrat39/rust-tools.nvim')

    -- use('mleonidas/solarized.nvim')

    use { 'lewis6991/gitsigns.nvim' }
    -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'tpope/vim-fugitive' }
    use("nvim-telescope/telescope-project.nvim")

    -- use 'mleonidas/tokyonight.nvim'
    use 'folke/tokyonight.nvim'

    -- use { 'tjdevries/cyclist.vim' }
    use "lukas-reineke/indent-blankline.nvim"


    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
    })


    -- tpope plugins
    use("tpope/vim-vinegar")
    use("tpope/vim-dispatch")
    use("tpope/vim-endwise" )
    use("tpope/vim-projectionist")
    use("tpope/vim-repeat")
    use("tpope/vim-unimpaired")


    -- better git blame
    use("f-person/git-blame.nvim")

    -- status bar
    use({
       "NTBBloodbath/galaxyline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
          {"hrsh7th/cmp-cmdline"},
          {"hrsh7th/cmp-nvim-lsp-signature-help"},
          {"onsails/lspkind.nvim"},
          {'tzachar/cmp-tabnine',
            run='./install.sh',
            requires = 'hrsh7th/nvim-cmp'}

	  }
  }
    -- All the things
    use("folke/trouble.nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")

    use("rafamadriz/friendly-snippets")

    -- Primeagen doesn"t create lodash
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")

    use("mbbill/undotree")

    use("folke/lsp-colors.nvim")

    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
    use("ellisonleao/gruvbox.nvim")
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    use("sebdah/vim-delve")
    use("leoluz/nvim-dap-go")
    use("folke/todo-comments.nvim")

    -- typescript bs
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')


    -- Github integration
    if vim.fn.executable "gh" == 1 then
        use "pwntester/octo.nvim"
    end
end)

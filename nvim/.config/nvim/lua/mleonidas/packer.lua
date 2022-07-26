return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")

    -- Simple plugins can be specified as strings
    use("TimUntersberger/neogit")

    -- rest client
    use("NTBBloodbath/rest.nvim")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-live-grep-args.nvim")

    use("AndrewRadev/splitjoin.vim")
    use("christoomey/vim-tmux-navigator")
    use("tmux-plugins/vim-tmux")
    use("jjo/vim-cue")
    use("LnL7/vim-nix")

    -- language plugins
    use("jose-elias-alvarez/null-ls.nvim")
    use("jose-elias-alvarez/nvim-lsp-ts-utils")

    use("ray-x/go.nvim")
    use("godlygeek/tabular")
    use("jremmen/vim-ripgrep")
    use("tomtom/tcomment_vim")
    use("tomtom/tlib_vim")
    use("lifepillar/pgsql.vim")
    use("ekalinin/Dockerfile.vim")
    use("earthly/earthly.vim")
    use("towolf/vim-helm")
    use("kyazdani42/nvim-web-devicons")
    use("ryanoasis/vim-devicons")
    use("MarcWeber/vim-addon-mw-utils")
    use("ishan9299/nvim-solarized-lua")

    use("pwntester/octo.nvim")
    use("airblade/vim-gitgutter")

    -- tpope plugins
    use("tpope/vim-vinegar")
    use("tpope/vim-dispatch")
    use("tpope/vim-endwise" )
    use("tpope/vim-fugitive")
    use("tpope/vim-projectionist")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")


    -- better git blame
    use("f-person/git-blame.nvim")

    -- status bar
    use("NTBBloodbath/galaxyline.nvim")

    -- All the things
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")

    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("folke/trouble.nvim")

    use("tzachar/cmp-tabnine", { run = "./install.sh" })

    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("rafamadriz/friendly-snippets")

    -- Primeagen doesn"t create lodash
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")

    use("mbbill/undotree")

    use("folke/lsp-colors.nvim")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

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


end)

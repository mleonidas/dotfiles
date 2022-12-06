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
    use { "nvim-telescope/telescope-file-browser.nvim" }

    use("AndrewRadev/splitjoin.vim")
    use("christoomey/vim-tmux-navigator")
    use("tmux-plugins/vim-tmux")
    use("jjo/vim-cue")
    use("LnL7/vim-nix")

    -- language plugins
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("averms/black-nvim")
    use {"ellisonleao/glow.nvim"}


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
    use 'simrat39/rust-tools.nvim'

    use('mleonidas/solarized.nvim')
    use('folke/tokyonight.nvim')

    use { 'lewis6991/gitsigns.nvim' }
    -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'tpope/vim-fugitive' }
    use("nvim-telescope/telescope-project.nvim")

    -- use { 'tjdevries/cyclist.vim' }
    use "lukas-reineke/indent-blankline.nvim"


    -- tpope plugins
    use("tpope/vim-vinegar")
    use("tpope/vim-dispatch")
    use("tpope/vim-endwise" )
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
    use("hrsh7th/cmp-nvim-lsp-signature-help")

    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("folke/trouble.nvim")

    use("tzachar/cmp-tabnine", {run='./install.sh', requires = 'hrsh7th/nvim-cmp'})

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

    -- Github integration
    if vim.fn.executable "gh" == 1 then
      use "pwntester/octo.nvim"
    end


end)

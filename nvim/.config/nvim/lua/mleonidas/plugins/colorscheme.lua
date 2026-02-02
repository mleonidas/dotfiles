return {
    "folke/tokyonight.nvim",
    lazy = false,
    version = "v4.11.0",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
}

return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function()
            require("neogit").setup({
                graph_style = "unicode",
                integrations = {
                    diffview = true,
                    telescope = true,
                },
                signs = {
                    hunk = { "", "" },
                    item = { "", "" },
                    section = { "", "" },
                },
            })

            local storm = {
                bg          = "#24283b",
                bg_dark     = "#1f2335",
                bg_highlight = "#292e42",
                fg          = "#c0caf5",
                fg_dark     = "#a9b1d6",
                comment     = "#565f89",
                blue        = "#7aa2f7",
                cyan        = "#7dcfff",
                green       = "#9ece6a",
                green_bg    = "#20303b",
                magenta     = "#bb9af7",
                orange      = "#ff9e64",
                red         = "#f7768e",
                red_bg      = "#37222c",
                yellow      = "#e0af68",
            }

            local function set_neogit_hl()
                local hl = vim.api.nvim_set_hl
                hl(0, "NeogitDiffAdd",            { fg = storm.green, bg = storm.green_bg })
                hl(0, "NeogitDiffAddHighlight",   { fg = storm.green, bg = storm.green_bg, bold = true })
                hl(0, "NeogitDiffDelete",         { fg = storm.red,   bg = storm.red_bg })
                hl(0, "NeogitDiffDeleteHighlight",{ fg = storm.red,   bg = storm.red_bg, bold = true })
                hl(0, "NeogitDiffContext",        { fg = storm.fg_dark, bg = storm.bg_dark })
                hl(0, "NeogitDiffContextHighlight", { fg = storm.fg, bg = storm.bg_highlight })
                hl(0, "NeogitHunkHeader",         { fg = storm.blue,  bg = storm.bg_dark, bold = true })
                hl(0, "NeogitHunkHeaderHighlight",{ fg = storm.blue,  bg = storm.bg_highlight, bold = true })
                hl(0, "NeogitBranch",             { fg = storm.orange, bold = true })
                hl(0, "NeogitRemote",             { fg = storm.magenta, bold = true })
                hl(0, "NeogitObjectId",           { fg = storm.comment })
                hl(0, "NeogitCommitViewHeader",   { fg = storm.bg_dark, bg = storm.blue, bold = true })
                hl(0, "NeogitSectionHeader",      { fg = storm.magenta, bold = true })
                hl(0, "NeogitFilePath",           { fg = storm.cyan, italic = true })
                hl(0, "NeogitNotificationInfo",   { fg = storm.blue })
                hl(0, "NeogitNotificationWarning",{ fg = storm.yellow })
                hl(0, "NeogitNotificationError",  { fg = storm.red })
                hl(0, "NeogitGraphRed",           { fg = storm.red })
                hl(0, "NeogitGraphGreen",         { fg = storm.green })
                hl(0, "NeogitGraphYellow",        { fg = storm.yellow })
                hl(0, "NeogitGraphBlue",          { fg = storm.blue })
                hl(0, "NeogitGraphPurple",        { fg = storm.magenta })
                hl(0, "NeogitGraphCyan",          { fg = storm.cyan })
                hl(0, "NeogitGraphOrange",        { fg = storm.orange })
                hl(0, "NeogitGraphBoldRed",       { fg = storm.red, bold = true })
                hl(0, "NeogitGraphBoldGreen",     { fg = storm.green, bold = true })
                hl(0, "NeogitGraphBoldYellow",    { fg = storm.yellow, bold = true })
                hl(0, "NeogitGraphBoldBlue",      { fg = storm.blue, bold = true })
                hl(0, "NeogitGraphBoldPurple",    { fg = storm.magenta, bold = true })
                hl(0, "NeogitGraphBoldCyan",      { fg = storm.cyan, bold = true })
                hl(0, "NeogitGraphBoldOrange",    { fg = storm.orange, bold = true })
            end

            set_neogit_hl()
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = set_neogit_hl,
            })
        end,
    },
}

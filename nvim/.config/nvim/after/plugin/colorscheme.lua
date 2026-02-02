require("tokyonight").setup({
    priority = 1000,
    style = "storm",
    lazy = false,
    styles = {
        -- comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = false },
        variables = {},
        floats = "dark", -- style for floating windows

        -- Background styles. Can be "dark", "transparent" or "normal"
        -- sidebars = {
        --     "qf",
        --     "vista_kind",
        --     "terminal",
        --     "spectre_panel",
        --     "startuptime",
        --     "Outline",
        -- },
    },
    on_highlights = function(hl, c)
        hl.CursorLineNr = { fg = c.orange, bold = true }
        hl.LineNr = { fg = c.orange, bold = true }
        hl.LineNrAbove = { fg = c.fg_gutter }
        hl.LineNrBelow = { fg = c.fg_gutter }
        local prompt = "#2d3149"
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        -- hl.rustFuncName = { fg = c.blue }
        -- hl.rustMacro = { fg = c.yellow }
        -- hl["@function.macro"] = { fg = c.yellow }
        -- hl.rustFuncName = { fg = c.blue }
        -- hl.rustSelf = { fg = c.green }
        -- hl["@namespace"] = { fg = c.green1 }
        -- hl["@function"] = { fg = c.blue }
    end,
    terminal_colors = true,
    transparent = false,
})
vim.cmd("colorscheme tokyonight-storm")
--

-- require("catppuccin").setup({
--     flavour = "auto", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = false, -- disables setting the background color.
--     show_end_of_buffer = false,  -- shows the '~' characters after the end of buffers
--     term_colors = false,         -- sets terminal colors (e.g. `g:terminal_color_0`)
--     dim_inactive = {
--         enabled = false,         -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15,       -- percentage of the shade to apply to the inactive window
--     },
--     no_italic = false,           -- Force no italic
--     no_bold = false,             -- Force no bold
--     no_underline = false,        -- Force no underline
--     styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { "italic" }, -- Change the style of comments
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--         -- miscs = {}, -- Uncomment to turn off hard-coded styles
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     default_integrations = true,
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         notify = false,
--         mini = {
--             enabled = true,
--             indentscope_color = "",
--         },
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })
--
-- -- setup must be called before loading
-- vim.cmd.colorscheme("catppuccin-frappe")

local wezterm = require("wezterm")

-- local launch_menu = {}
-- local default_shell = "/bin/zsh"
local padding = {
    left = "1cell",
    right = "1cell",
    top = "0.5cell",
    bottom = "0.5cell",
}

-- Reload the configuration every ten minutes

return {
    bidi_enabled = true,
    bidi_direction = "AutoLeftToRight",
    color_scheme = "tokyonight_storm",
    font = wezterm.font("MesloLGMDZ Nerd Font Mono"),
    keys = {
        { key = "n", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
        { key = "v", mods = "CMD",  action = wezterm.action.Paste },
        { key = "c", mods = "CMD",  action = wezterm.action.Copy },
    },
    -- leader = { key = "a", mods = "CTRL" },
    -- keys = {
    -- 	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    -- 	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
    -- 	{ key = "\"", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    -- 	{ key = "%", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    -- 	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
    -- 	{ key = "t", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    -- 	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    -- 	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    -- 	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    -- 	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    -- 	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    -- 	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
    -- 	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    -- 	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    -- 	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
    -- 	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
    -- 	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
    -- 	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
    -- 	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
    -- 	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
    -- 	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
    -- 	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
    -- 	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
    -- 	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
    -- 	{ key = "w", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
    -- 	-- { key = "z", mods = "LEADER", action = "ToggleFullScreen" },
    -- },
    initial_cols = 128,
    initial_rows = 32,
    use_dead_keys = false,
    window_padding = padding,
    window_decorations = "RESIZE",
    use_ime = false,
    hide_tab_bar_if_only_one_tab = true,
    selection_word_boundary = " \t\n{}[]()\"'`,;:@",
    -- disable_default_key_bindings = true,
    line_height = 1.25,
    font_size = 12,
    -- window_background_opacity = 0.95,
    bold_brightens_ansi_colors = false,
    -- term = "wezterm",
    -- freetype_load_target = "Light",
}

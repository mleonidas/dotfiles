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
--
local config = {}

if wezterm.config_builder() then
	config = wezterm.config_builder()
end

config.bidi_enabled = true
config.bidi_direction = "AutoLeftToRight"
config.color_scheme = "tokyonight_storm"
-- config.color_scheme = "nordfox"
-- config.color_scheme = 'Nord (Gogh)'

config.font = wezterm.font("Liga SFMono Nerd Font", { weight = "Regular", stretch = "Normal" })
-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "CaskaydiaCove Nerd Font",
-- 	},
-- 	{ family = "Terminus", weight = "Bold" },
-- 	"Noto Color Emoji",
-- })

config.keys = {
	{ key = "Enter", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
}

-- config.initial_cols = 128
-- config.initial_rows = 32
config.use_dead_keys = false
config.window_padding = padding
config.window_decorations = "RESIZE"
config.use_ime = false
config.hide_tab_bar_if_only_one_tab = true
config.selection_word_boundary = " \t\n{}[]()\"'`,;:@"
config.line_height = 1.25
config.font_size = 13
config.bold_brightens_ansi_colors = true
config.front_end = "OpenGL"
return config

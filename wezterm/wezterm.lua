local wezterm = require("wezterm")
local commands = require("modules")

local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

config.color_scheme = "carbonfox"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 18
config.command_palette_font_size = 18
config.command_palette_rows = 20
config.window_background_opacity = 0.9

return config

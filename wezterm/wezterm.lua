local wezterm = require("wezterm")
local commands = require("modules")

local config = wezterm.config_builder()

config.color_scheme = "carbonfox"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font = wezterm.font_with_fallback({ "JetBrains Mono", "SF Pro" })
config.font_size = 22
config.command_palette_font_size = 22
config.command_palette_rows = 20
config.window_background_opacity = 0.9
config.audible_bell = "Disabled"
return config

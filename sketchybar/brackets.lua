local colors = require("colors")

local bracket_style = {
	background = {
		border_width = 1,
		border_color = colors.with_alpha(colors.white, 0.7),
		color = colors.with_alpha(colors.bar.bg, 0.65),
		height = 35,
	},
}

sbar.add("bracket", "bracket.apple", { "apple" }, bracket_style)

sbar.add("bracket", "bracket.workspace", { "front_app" }, bracket_style)

sbar.add("bracket", "bracker.aerospace", { "aerospace" }, bracket_style)

sbar.add("bracket", "bracket.widgets", {
	"widgets.battery",
	"widgets.volume1",
	"widgets.volume2",
	"widgets.wifi1",
	"widgets.wifi2",
	"widgets.wifi.padding",
}, bracket_style)

sbar.add("bracket", "bracket.calendar", { "calendar" }, bracket_style)

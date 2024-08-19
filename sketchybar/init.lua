local colors = require("colors")
-- Require the sketchybar module
SBAR = require("sketchybar")
sbar = SBAR

-- Bundle the entire initial configuration into a single message to sketchybar
sbar.begin_config()

require("bar")
require("default")
require("items")

sbar.add("bracket", "bracket.apple", { "apple" }, {
	background = {
		color = colors.with_alpha(colors.bar.bg, 0.65),
		height = 35,
	},
})

sbar.add("bracket", "bracket.workspace", { "aerospace", "front_app" }, {
	background = {
		color = colors.with_alpha(colors.bar.bg, 0.65),
		height = 35,
	},
})

sbar.add("bracket", "bracker.tasks", { "taskwarrior" }, {
	background = {
		color = colors.with_alpha(colors.bar.bg, 0.65),
		height = 35,
	},
})

sbar.add("bracket", "bracket.widgets", {
	"widgets.battery",
	"widgets.volume1",
	"widgets.volume2",
	"widgets.wifi1",
	"widgets.wifi2",
	"widgets.wifi.padding",
}, {
	padding_left = 10,
	padding_right = 10,
	background = {
		color = colors.with_alpha(colors.bar.bg, 0.65),
		height = 35,
	},
})

sbar.add("bracket", "bracket.calendar", { "calendar" }, {
	background = {
		color = colors.with_alpha(colors.bar.bg, 0.65),
		height = 35,
	},
})

sbar.end_config()

-- Run the event loop of the sketchybar module (without this there will be no
-- callback functions executed in the lua module)
sbar.event_loop()

-- local colors = require("colors")
local settings = require("settings")

local front_app = sbar.add("item", "front_app", {
	display = "active",
	position = "left",
	label = {
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
		width = 75,
	},
	icon = {
		background = {
			drawing = true,
		},
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		label = { string = env.INFO },
		icon = { background = { image = "app." .. env.INFO } },
	})
end)

front_app:subscribe("mouse.clicked", function()
	sbar.trigger("swap_menus_and_spaces")
end)

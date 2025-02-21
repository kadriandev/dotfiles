local settings = require("settings")
local colors = require("colors")

local front_app = sbar.add("item", "front_app", {
	display = "active",
	position = "left",
	padding_left = 10,
	label = {
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
		width = 100,
		color = colors.magenta,
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
		icon = {
			background = {
				image = {
					string = "app." .. env.INFO,
					scale = 0.8,
				},
			},
		},
	})
end)

front_app:subscribe("mouse.clicked", function()
	sbar.trigger("swap_menus_and_spaces")
end)

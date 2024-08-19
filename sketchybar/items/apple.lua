local colors = require("colors")
local icons = require("icons")

sbar.add("item", "apple", {
	icon = {
		color = colors.white,
		string = icons.apple,
		padding_right = 15,
		padding_left = 15,
	},
	label = { drawing = false },
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
})

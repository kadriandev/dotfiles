local colors = require("colors")
local settings = require("settings")

local cal = sbar.add("item", "calendar", {
	icon = {
		color = colors.magenta,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	label = {
		-- color = colors.magenta,
		padding_right = 8,
		width = 49,
		align = "right",
		font = { family = settings.font.numbers },
	},
	position = "right",
	update_freq = 30,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bg2,
	},
})

-- Double border for calendar using a single item bracket
-- sbar.add("bracket", { cal.name }, {
-- 	background = {
-- 		color = colors.transparent,
-- 		height = 30,
-- 		border_color = colors.grey,
-- 	},
-- })

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ icon = os.date("%a. %d %b."), label = os.date("%H:%M") })
end)

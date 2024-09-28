local settings = require("settings")
local colors = require("colors")

sbar.add("event", "aerospace_workspace_change")

local aerospace = sbar.add("item", "aerospace", {
	position = "left",
	padding_left = 20,
	icon = {
		font = {
			style = settings.font.style_map["Black"],
			size = 22.0,
		},
	},
	updates = true,
})

aerospace:subscribe("aerospace_workspace_change", function()
	sbar.exec("aerospace list-workspaces --focused", function(result)
		aerospace:set({
			icon = {
				string = result,
				color = colors.white,
			},
		})
	end)
end)

-- sbar.trigger("aerospace_workspace_change")
local settings = require("settings")

sbar.add("event", "aerospace_workspace_change")

local aerospace = sbar.add("item", "aerospace", {
	position = "left",
	label = {
		font = {
			style = settings.font.style_map["Black"],
			size = 18.0,
		},
	},
	updates = true,
})

aerospace:subscribe("aerospace_workspace_change", function()
	sbar.exec("aerospace list-workspaces --focused", function(result)
		aerospace:set({
			label = { string = result },
		})
	end)
end)

sbar.trigger("aerospace_workspace_change")

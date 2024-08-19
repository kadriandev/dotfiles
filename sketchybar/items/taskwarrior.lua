#!/bin/bash

-- taskwarrior=(
--   script="$PLUGIN_DIR/taskwarrior.sh"
--   update_freq=120
--   icon=󱃔
--   icon.color=$ORANGE
--   label.color=$ORANGE
-- )
-- task_template=(
--   drawing=off
--   background.corner_radius=12
--   padding_left=7
--   padding_right=7
-- )
-- events=(
--   mouse.entered
--   mouse.exited
-- )
-- sketchybar --add item taskwarrior right \
--   --set taskwarrior "${taskwarrior[@]}" \
--   --subscribe taskwarrior "${events[@]}" \
--   --add item task.template popup.taskwarrior \
--   --set task.template "${task_template[@]}"

local settings = require("settings")
local colors = require("colors")

local taskwarrior = sbar.add("item", "taskwarrior", {
	position = "q",
	icon = {
		string = "󱃔",
		color = colors.white,
	},
	label = {
		string = "Tasks",
		font = {
			style = settings.font.style_map["Black"],
			size = 13.0,
		},
	},
	script = settings.plugin_dir .. "/taskwarrior.sh",
	update_freq = 120,
	updates = true,
})

local popup = sbar.add("item", "tasks.popup", {
	position = "popup." .. taskwarrior.name,
	icon = {
		string = "Tasks:",
		color = colors.white,
		font = {
			size = 12.0,
		},
		width = 100,
		align = "left",
	},
	label = {
		string = "(0)",
		width = 200,
		align = "right",
	},
})

sbar.add("item", "task.template", {
	position = "popup." .. taskwarrior.name,
	drawing = "off",
})

taskwarrior:subscribe({ "mouse.entered" }, function()
	sbar.remove("/tasks.pending.*/")

	taskwarrior:set({ popup = { drawing = "on" } })
	sbar.exec("task +PENDING count", function(result)
		popup:set({ label = "(" .. result .. ")" })
	end)

	sbar.exec("task +PENDING export", function(result)
		for index, value in ipairs(result) do
			sbar.add("item", "tasks.pending." .. tostring(index), {
				position = "popup." .. taskwarrior.name,
				icon = {
					string = os.date("%m-%d %H:%M:%S", value.entry),
					color = colors.white,
					font = {
						size = 12,
					},
					width = 20,
					align = "left",
				},
				label = {
					string = value.description,
					width = 180,
					align = "right",
				},
			})
		end
		-- popup_tasks:set({ label = { string = result.description } })
	end)
end)

taskwarrior:subscribe({ "mouse.exited" }, function()
	taskwarrior:set({ popup = { drawing = "off" } })
end)

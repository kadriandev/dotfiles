#!/bin/bash
local settings = require("settings")
local colors = require("colors")

local taskwarrior = sbar.add("item", "taskwarrior", {
	position = "q",
	icon = {
		string = "󱃔",
		color = colors.white,
	},
	label = {
		string = "",
		font = {
			style = settings.font.style_map["Black"],
			size = 13.0,
		},
	},
	update_freq = 120,
	updates = true,
})

local function toggle_popup()
	taskwarrior:set({ popup = { drawing = "toggle" } })
end

local function update()
	sbar.exec("task +PENDING count", function(result)
		taskwarrior:set({ label = result })
	end)
end

local function list_tasks()
	sbar.remove("/tasks\\.pending\\.*/")

	sbar.exec("task +PENDING export", function(result)
		taskwarrior:set({ label = #result })

		if #result > 0 then
			for index, value in ipairs(result) do
				sbar.add("item", "tasks.pending." .. tostring(index), {
					drawing = "on",
					position = "popup." .. taskwarrior.name,
					icon = {
						string = os.date("%m-%d %H:%M:%S", tonumber(value.entry)),
						color = colors.white,
						font = {
							size = 12,
						},
						width = 20,
						align = "left",
					},
					label = {
						string = value.description,
						width = 380,
						align = "right",
					},
				})
			end
		else
			sbar.add("item", "tasks.pending.none", {
				position = "popup." .. taskwarrior.name,
				label = {
					string = "No tasks",
					width = 200,
					align = "center",
				},
			})
		end

		toggle_popup()
	end)
end

taskwarrior:subscribe({ "update", "forced" }, function()
	update()
end)

taskwarrior:subscribe({ "mouse.clicked" }, function()
	update()
	list_tasks()
end)

-- taskwarrior:subscribe({ "mouse.entered" }, function()
-- 	update()
-- 	list_tasks()
-- end)
--
-- taskwarrior:subscribe({ "mouse.exited" }, function()
-- 	popup(false)
-- end)

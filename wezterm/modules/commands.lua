local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("augment-command-palette", function(window, pane)
	return {
		{
			brief = "Rename Tab",
			icon = "md_rename_box",

			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	}
end)

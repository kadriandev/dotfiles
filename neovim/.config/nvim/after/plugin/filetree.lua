-- empty setup using defaults
require("nvim-tree").setup()

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 70
local height = 30

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",

	view = {
		width = 30,
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				width = width,
				height = height,
				row = (gheight - height) * 0.4,
				col = (gwidth - width) * 0.5,
			},
		},
	},
	renderer = {
		group_empty = true,
		root_folder_label = "Explorer",
	},
	update_focused_file = {
		enable = true,
	},
	filters = {
		dotfiles = false,
	},
})

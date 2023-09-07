require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
		layout_config = {
			width = 0.90,
			preview_cutoff = 120,
			preview_width = 0.6,
		},
		file_ignore_patterns = { "^./.git/", "^node_modules/" },
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_mru = true,
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer",
				},
			},
		},
	},
	extentions = {},
})

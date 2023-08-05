local builtin = require("telescope.builtin")

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
			prompt_position = "top",
			preview_cutoff = 120,
			preview_width = 0.6,
			-- vertical = { mirror = true },
		},
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

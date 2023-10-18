local width = 80
local height = 30

Map("n", "<leader>e", "<cmd>lua require('oil').toggle_float(nil)<cr>")

require("oil").setup({
	float = {
		padding = 0,
		max_width = width,
		max_height = height,
	},
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<esc>"] = "actions.close",
		["<C-s>"] = "actions.select_vsplit",
		["<C-l>"] = "actions.refresh",
		["."] = "actions.parent",
		["/"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["gh"] = "actions.toggle_hidden",
	},
	view_options = {
		is_always_hidden = function(name, bufnr)
			return name == ".DS_Store"
		end,
	},
})

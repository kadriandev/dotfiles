local wk = require("which-key")

wk.setup({
	plugins = {
		presets = {
			g = false,
		},
	},
})

wk.register({
	f = {
		name = "Telescope", -- optional group name
		f = { ":Telescope find_files hidden=true<cr>", "Find Files" }, -- create a binding with label
		t = { ":Telescope live_grep<cr>", "Live Grep" },
		b = { ":Telescope buffers<cr>", "Buffers" },
		h = { ":Telescope help_tags<cr>", "Search Help Tags" },
		g = { ":Telescope git_files<cr>", "Search Git Files" },
	},
	c = {
		name = "Code",
		a = { ":CodeActionMenu<cr>", "Code Action" },
		t = { ":Trouble<cr>", "Trouble" },
	},
}, { prefix = "<leader>" })

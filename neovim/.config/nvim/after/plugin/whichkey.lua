local wk = require("which-key")

wk.register({
	f = {
		name = "Telescope", -- optional group name
		f = { ":Telescope find_files<cr>", "Find Files" }, -- create a binding with label
		t = { ":Telescope live_grep<cr>", "Live Grep" },
		b = { ":Telescope buffers<cr>", "Buffers" },
		h = { ":Telescope help_tags<cr>", "Search Help Tags" },
		g = { ":Telescope git_files<cr>", "Search Git Files" },
	},
	d = {
		name = "Diagnostic",
		a = { ":CodeActionMenu<cr>", "Code Action" },
		t = { ":Trouble<cr>", "Trouble" },
	},
	e = { "<cmd>NvimTreeToggle<cr>", "Open File Tree" },
}, { prefix = "<leader>" })

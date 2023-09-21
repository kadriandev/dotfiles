require("obsidian").setup({
	dir = "~/obsidian", -- no need to call 'vim.fn.expand' here
	notes_subdir = "notes",
	daily_notes = {
		folder = "notes/dailies",
		date_format = "%Y-%m-%d",
		alias_format = "%B %-d, %Y",
	},
	completion = {
		nvim_cmp = true,
		min_chars = 2,
		new_notes_location = "current_dir",
		prepend_note_id = true,
	},
})

vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, { noremap = false, expr = true })

require("which-key").register({
	o = {
		name = "Obsidian",
		f = { "<cmd>ObsidianQuickSwitch<cr>", "Find Note" },
		n = { "<cmd>ObsidianNew<cr>", "New Note" },
		t = { "<cmd>ObsidianToday<cr>", "Today's Daily Note" },
		y = { "<cmd>ObsidianYesterday<cr>", "Yesterday's Daily Note" },
		T = { "<cmd>ObsidianTemplate<cr>", "Templates" },
	},
}, { prefix = "<leader>" })

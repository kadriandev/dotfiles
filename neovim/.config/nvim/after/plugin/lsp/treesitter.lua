-- local swap_next, swap_prev = (function()
-- 	local swap_objects = {
-- 		p = "@parameter.inner",
-- 		f = "@function.outer",
-- 		c = "@class.outer",
-- 	}
--
-- 	local n, p = {}, {}
-- 	for key, obj in pairs(swap_objects) do
-- 		n[string.format("<A-n><A-%s>", key)] = obj
-- 		p[string.format("<A-p><A-%s>", key)] = obj
-- 	end
--
-- 	return n, p
-- end)()
--
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "javascript", "go", "json", "query", "tsx", "markdown", "markdown_inline" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
	autotag = {
		enable = true,
	},
	textsubjects = {
		enable = true,
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["vl"] = { query = "@assignment.lhs", desc = "Select left hand side of assignment" },
				["vr"] = "@assignment.rhs",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["iC"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
		},
		move = {},
		swap = {
			enable = true,
			swap_next = {
				["sn"] = "@parameter.inner",
			},
			swap_previous = {
				["sp"] = "@parameter.inner",
			},
		},
	},
})

vim.keymap.set("n", "s", "")

require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

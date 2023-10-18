require("dressing").setup({
	input = {
		get_config = function()
			if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
				return { enabled = false }
			end
		end,
	},
})

vim.opt.list = true

require("indent_blankline").setup({})

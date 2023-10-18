require("catppuccin").setup({
	flavour = "mocha",
	term_colors = true,
	transparent_background = true,
	color_overrides = {
		mocha = {
			base = "#000000",
			mantle = "#000000",
			crust = "#000000",
		},
	},
	integrations = {
		alpha = true,
		nvimtree = true,
		cmp = true,
		mason = true,
		harpoon = true,
		telescope = true,
		indent_blankline = true,
		lsp_trouble = true,
		which_key = true,
		treesitter = true,
	},
})

vim.cmd("colorscheme catppuccin")

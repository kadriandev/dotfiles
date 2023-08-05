require("catppuccin").setup({
	flavour = "mocha",
})

vim.cmd("colorscheme catppuccin")
--vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

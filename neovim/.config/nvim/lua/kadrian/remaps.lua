function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true, desc = "which_key_ignore" }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

Map("n", "<Esc>", "<cmd>noh<cr>")
Map("i", "jk", "<esc>")

Map("n", "<leader>w", "<cmd>w<cr>")

Map("n", "<leader>qq", "<cmd>qa<cr>")

Map("n", "<leader>x", "<cmd>bd<cr>")

Map("i", "<C-h>", "<Left>")
Map("i", "<C-l>", "<Right>")
Map("i", "<C-j>", "<Down>")
Map("i", "<C-k>", "<Up>")

Map("n", "<C-u>", "<C-u>zz")
Map("n", "<C-d>", "<C-d>zz")

Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

Map("n", "J", "mzJ`z")
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

Map("n", "`", "<cmd>lua require'hop'.hint_words()<cr>")
Map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end)
Map("v", "<leader>/", function()
	require("Comment.api").toggle.blockwise.current()
end)

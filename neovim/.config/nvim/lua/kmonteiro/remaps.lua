local opts = { silent = true, noremap = true }

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

Map("i", "jk", "<esc>")

Map("n", "<leader>w", "<cmd>w<cr>")
Map("i", "<leader>w", "<esc><cmd>w<cr>")

Map("n", "<leader>qq", "<cmd>qa<cr>")

Map("n", "<leader>x", "<cmd>bd<cr>")

Map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

Map("i", "<C-h>", "<Left>")
Map("i", "<C-l>", "<Right>")
Map("i", "<C-j>", "<Down>")
Map("i", "<C-k>", "<Up>")

Map("n", "<C-u>", "<C-u>zz")
Map("n", "<C-d>", "<C-d>zz")

Map("n", "<leader>/", "gcc")

Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

Map("n", "J", "mzJ`z")
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

Map("n", "`", "<cmd>lua require'hop'.hint_words()<cr>")

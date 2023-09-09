local wk = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal
local floatTerm = Terminal:new({
	dir = "git_dir",
	direction = "float",
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	on_close = function(term)
		vim.cmd("startinsert!")
	end,
})
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("startinsert!")
	end,
	hidden = true,
})

function _toggleTerm(term)
	if term == "lazygit" then
		lazygit:toggle()
	elseif term == "term" then
		floatTerm:toggle()
	end
end

vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _toggleTerm('term')<cr>", { noremap = true, silent = true })
wk.register({
	t = {
		name = "Terminal",
		g = { "<cmd>lua _toggleTerm('lazygit')<cr>", "LazyGit" },
	},
}, { prefix = "<leader>" })
-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

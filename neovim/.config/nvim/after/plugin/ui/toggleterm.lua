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

function ToggleTerminal(term)
	if term == "lazygit" then
		lazygit:toggle()
	elseif term == "term" then
		floatTerm:toggle()
	end
end

Map("n", "<C-t>", "<cmd>lua ToggleTerminal('term')<cr>")
Map("n", "<leader>gg", "<cmd>lua ToggleTerminal('lazygit')<cr>")

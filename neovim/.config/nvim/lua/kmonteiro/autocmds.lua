-- Autocommand
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("nx_keybinds", {}),
	desc = "Loads Nx if is a Nx project",
	callback = function()
		require("nx.read-configs").read_nx(function(isNx)
			if isNx then
				vim.schedule(function()
					Map("n", "<leader>cna", ":Telescope nx actions<cr>", { desc = "Actions" })
					Map("n", "<leader>cng", ":Telescope nx generators<cr>", { desc = "Generators" })
				end)
			end
		end)
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
	end,
})

local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"eslint",
	"tsserver",
	"lua_ls",
	"gopls",
})

lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({
		buffer = bufnr,
		omit = { "F4" },
	})
end)

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "typescriptreact", "lua", "go", "html" },
	},
})

lsp.skip_server_setup({ "tsserver", "lua_ls" })
require("typescript").setup({
	server = {
		on_attach = function(client, bufnr)
			require("which-key").register({
				t = {
					name = "Typescript",
				},
			})
			Map(
				"n",
				"<leader>tm",
				"<cmd>TypescriptAddMissingImports<cr>",
				{ buffer = bufnr, desc = "Add Missing Imports" }
			)
			Map("n", "<leader>to", "<cmd>TypescriptOrganizeImports<cr>", { buffer = bufnr, desc = "Organize Imports" })
			Map(
				"n",
				"<leader>tr",
				"<cmd>TypescriptRemoveUnused<cr>",
				{ buffer = bufnr, desc = "Remove Unused Imports" }
			)
		end,
	},
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

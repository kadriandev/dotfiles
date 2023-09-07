local lsp = require("lsp-zero")

lsp.preset("recommended")

require("luasnip").filetype_extend("typescript", { "typescriptreact" })
require("luasnip").filetype_extend("javascript", { "javascriptreact" })
require("luasnip").filetype_extend("typescript", { "html" })
require("luasnip").filetype_extend("javascript", { "html" })

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
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	local ih = require("inlay-hints")
	ih.on_attach(client, bufnr)
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
		["null-ls"] = { "javascript", "typescript", "typescriptreact", "lua", "go" },
	},
})

lsp.skip_server_setup({ "tsserver", "lua_ls" })
require("typescript").setup({
	server = {
		on_attach = function(client, bufnr)
			vim.lsp.buf.inlay_hint(bufnr, true)

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
		settings = {
			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		},
	},
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require("cmp")
-- local cmp_action = require("lsp-zero").cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
		["<C-n>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = {
			max_height = 15,
			max_width = 60,
		},
	},
	formatting = {
		fields = { "abbr", "menu", "kind" },
		format = function(entry, item)
			local short_name = {
				nvim_lsp = "LSP",
				nvim_lua = "nvim",
			}

			local menu_name = short_name[entry.source.name] or entry.source.name

			item.menu = string.format("[%s]", menu_name)
			return item
		end,
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.gofmt,
	},
})

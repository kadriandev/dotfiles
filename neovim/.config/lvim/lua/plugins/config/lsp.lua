vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
  "tailwindcss",
  -- "typescript-language-server",
})

-- require("typescript").setup({
--   server = { -- pass options to lspconfig's setup method
--     filetypes = {
--       "javascript",
--       "javascriptreact",
--       "javascript.jsx",
--       "typescript",
--       "typescriptreact",
--       "typescript.tsx",
--     },
--     -- root_dir = function()
--     -- return vim.loop.cwd()
--     -- end, -- run lsp for javascript in any directory
--   },
-- })

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "prettierd", command = "prettierd", filetypes = { "typescript", "typescriptreact" } },
  { name = "stylua",    filetypes = { 'lua' } },
})

local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
-- { name = "eslint" }, CONFLICTS WITH TSSERVER
-- })

local code_actions = require("lvim.lsp.null-ls.code_actions")
local ts_found, ts_code_actions = pcall(require, "typescript.extentions.null-ls.code_actions")
local code_action_sources = {}
table.insert(
  code_action_sources,
  { command = "eslint", filetypes = { "typescript", "typescriptreact" }, }
)
if ts_found then
  table.insert(code_action_sources, ts_code_actions);
end
code_actions.setup(code_action_sources)

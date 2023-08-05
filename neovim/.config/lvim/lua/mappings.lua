-- X closes a buffer
lvim.builtin.which_key.mappings["c"] = nil
lvim.builtin.which_key.mappings["x"] = { ":BufferKill<CR>", "Close Buffer" }

-- Better Movement
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.insert_mode["<C-j>"] = "<Up>"
lvim.keys.insert_mode["<C-k>"] = "<Down>"

lvim.keys.normal_mode["<Tab>"] = ":bn<cr>";
lvim.keys.normal_mode["<S-Tab>"] = ":bp<cr>";

-- Escape insert mode
lvim.keys.insert_mode["jk"] = "<Esc>"

-- Exit Neovim
lvim.builtin.which_key.mappings['q'] = nil
lvim.keys.normal_mode['<leader>qq'] = ':qa<cr>'

-- LSP
lvim.builtin.which_key.mappings["d"] = {
  name = "Diagnostics",
  f = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show in Floating Window" },
}

lvim.builtin.which_key.mappings["b"] = {
  name = "Buffer",
}

-- Find remap
lvim.builtin.which_key.mappings["f"] = lvim.builtin.which_key.mappings["s"]
lvim.builtin.which_key.mappings["s"] = nil

-- Hop
lvim.keys.normal_mode["q"] = "<cmd>lua require'hop'.hint_words()<cr>"

-- Harpoon
lvim.builtin.which_key.mappings["h"] = {
  name = "Harpoon",
  a = { ":lua require('harpoon.mark').add_file()<CR>", "Add to Harpoon" },
  h = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "Show Harpoon List" },
  n = { ":lua require('harpoon.ui').nav_next()<CR>", "Next Harpoon Mark" },
  p = { ":lua require('harpoon.ui').nav_prev()<CR>", "Previous Harpoon Mark" },
}

-- Terminal
lvim.keys.normal_mode["<C-t>"] = "<cmd>ToggleTerm<cr>"
lvim.keys.term_mode["<C-t>"] = "<cmd>ToggleTerm<cr>"

-- TS Tools
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "TypeScript",
--   a = { ":TSToolsFixAll<CR>", "Fix Errors" },
--   o = { ":TSToolsOrganizeImports<CR>", "Organize Imports" },
--   s = { ":TSToolsSortImports<CR>", "Sort Imports" },
--   r = { ":TSToolsRemoveUnusedImports<CR>", "Remove Unused Imports" },
--   R = { ":TSToolsRemoveUnused<CR>", "Remove Unused Statements" },
--   m = { ":TSToolsAddMissingImports<CR>", "Add Missing Imports" },
-- }

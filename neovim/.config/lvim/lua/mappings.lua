-- X closes a buffer
lvim.lsp.buffer_mappings.normal_mode["<leader>c"] = nil
lvim.keys.normal_mode["<leader>x"] = ":BufferKill<CR>"

-- Move Buffers With Tabs
lvim.keys.normal_mode["<Tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bp<CR>"

-- Better Movement
lvim.keys.normal_mode["J"] = "5j"
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.keys.normal_mode["K"] = "5k"

lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.insert_mode["<C-j>"] = "<Up>"
lvim.keys.insert_mode["<C-k>"] = "<Down>"

-- Escape insert mode
lvim.keys.insert_mode["jk"] = "<Esc>"

-- Exit Neovim
lvim.keys.normal_mode["<leader>q"] = false
lvim.keys.normal_mode["<leader>qq"] = ":qa<CR>"

-- Find remap
lvim.builtin.which_key["f"] = lvim.builtin.which_key["s"]

-- Hop
lvim.keys.normal_mode["q"] = "<cmd>lua require'hop'.hint_words()<cr>"

-- Harpoon
lvim.builtin.which_key.mappings["h"] = {
  name = "Harpoon",
  a = { ":lua require('harpoon.mark').add_file()<CR>", "Add to Harpoon" },
  l = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "Show Harpoon List" },
  n = { ":lua require('harpoon.ui').nav_next()<CR>", "Next Harpoon Mark" },
  p = { ":lua require('harpoon.ui').nav_prev()<CR>", "Previous Harpoon Mark" },
}

-- Terminal
lvim.keys.normal_mode["<C-t>"] = "<cmd>ToggleTerm<cr>"
lvim.keys.term_mode["<C-t>"] = "<cmd>ToggleTerm<cr>"
lvim.builtin.which_key.mappings["t"] = {
  name = "Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

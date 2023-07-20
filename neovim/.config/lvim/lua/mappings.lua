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

lvim.keys.normal_mode["$"] = "<cmd>lua require'hop'.hint_words()<cr>"

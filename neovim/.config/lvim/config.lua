-- General
lvim.format_on_save = true

require("mappings")

local utils = require("plugins.utils")
lvim.plugins = require("plugins")
utils.loadrequire("plugins.styles.tokyonight")

lvim.builtin.nvimtree.setup.update_focused_file.update_root = false

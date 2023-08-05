local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

Map("n", "<leader>a", mark.add_file)
Map("n", "<C-e>", ui.toggle_quick_menu)

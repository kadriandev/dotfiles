local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

Map("n", "<leader>ja", mark.add_file, { desc = "Add to Harpoon" })
Map("n", "<C-e>", ui.toggle_quick_menu)

Map("n", "<C-n>", function()
	ui.nav_next()
end)

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")

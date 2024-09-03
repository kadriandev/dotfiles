local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	height = 40,
	position = "top",
	color = colors.with_alpha(colors.bar.bg, 0.4),
	corner_radius = 15,
	y_offset = 0,
	margin = 0,
	shadow = true,
})

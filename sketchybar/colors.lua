-- local colors = {
-- 	black = 0xff221d23,
-- 	white = 0xffcdd6f4,
-- 	red = 0xffcba6f7,
-- 	green = 0xffa6e3a1,
-- 	blue = 0xff556fd7,
-- 	yellow = 0xffa6e3a1,
-- 	orange = 0xfffab387,
-- 	magenta = 0xffcba6f7,
-- 	grey = 0xff939ab7,
-- 	transparent = 0x00000000,
-- 	mauve = 0xffc6a0f7,
-- 	purple = 0xff736fda,
-- 	dark = 0xff051b2c,
--
-- 	bar = {
-- 		bg = 0xff060010,
-- 		border = 0xff494d64,
-- 	},
--
-- 	popup = {
-- 		bg = 0xff1d1d2b,
-- 		border = 0xffc6a0f7,
-- 	},
--
-- 	bg1 = 0xff485696,
-- 	bg2 = 0xff45475a,
--
-- 	with_alpha = function(color, alpha)
-- 		if alpha > 1.0 or alpha < 0.0 then
-- 			return color
-- 		end
-- 		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
-- 	end,
-- }
--
-- colors.bar.bg = colors.with_alpha(colors.bar.bg, 1.0)
-- colors.bg1 = colors.with_alpha(colors.bg1, 1.0)
-- colors.bg2 = colors.transparent
-- return colors

local kadrian_colors = {
	black = 0xff0d1116,
	white = 0xffebfafa,
	red = 0xfff16c75,
	green = 0xff37f499,
	blue = 0xff04d1f9,
	yellow = 0xfff1fc79,
	orange = 0xff987afb,
	magenta = 0xff949ae5,
	grey = 0xffa5afe2,
	transparent = 0x00000000,
	BG0 = 0xff0d1116,
	BG0O50 = 0x800d1116,
	BG0O60 = 0x990d1116,
	BG0O70 = 0xb20d1116,
	BG0O80 = 0xcc0d1116,
	BG0O85 = 0xdb0d1116,
	ICON_COLOR = 0xffebfafa,
	LABEL_COLOR = 0xffebfafa,
	SHADOW_COLOR = 0xff0d1116,
	bar = {
		bg = 0xdb0d1116,
		border = 0x601c242f,
	},
	popup = {
		bg = 0xdb0d1116,
		border = 0xffebfafa,
	},
	bg1 = 0x60314154,
	bg2 = 0x601c242f,
	-- mauve = 0xffc6a0f7,
	-- purple = 0xff736fda,
	-- dark = 0xff051b2c,
	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}

kadrian_colors.bar.bg = kadrian_colors.with_alpha(kadrian_colors.bar.bg, 1.0)
kadrian_colors.bg1 = kadrian_colors.with_alpha(kadrian_colors.bg1, 1.0)
kadrian_colors.bg2 = kadrian_colors.transparent
return kadrian_colors

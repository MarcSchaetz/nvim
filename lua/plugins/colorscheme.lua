return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		on_highlights = function(highlights, colors)
			highlights.LineNrAbove = { fg = colors.fg_dark }
			highlights.LineNr = { fg = colors.orange }
			highlights.LineNrBelow = { fg = colors.fg_dark }
		end,
	}
}

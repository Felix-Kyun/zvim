require("hlchunk").setup({
	line_num = {
		enable = true,
		style = "#74c7ec",
	},
	indent = {
		enable = true,
		chars = {
			"│",
		},
		style = {
			vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
		},
	},
	chunk = {
		enable = true,
		chars = {
			horizontal_line = "─",
			vertical_line = "│",
			left_top = "╭",
			left_bottom = "╰",
			right_arrow = ">",
		},
		style = "#74c7ec",
	},
})

local lualine_tabs = {
	"tabs",
	max_length = vim.o.columns,
	mode = 2,
	path = 0,
	use_mode_colors = true,
}

require("lualine").setup({
	theme = "catppuccin",
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat" },
		lualine_y = { "filetype", "progress" },
		lualine_z = { "location" },
	},
	-- tabline = {
	-- 	lualine_a = { lualine_tabs },
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = { "lsp_status" },
	-- },
})

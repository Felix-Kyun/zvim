return {
	scale = {
		increase = function(value)
			vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + (value or 0.1)
		end,
		decrease = function(value)
			vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - (value or 0.1)
		end,
		reset = function()
			vim.g.neovide_scale_factor = 1.0
		end,
	},
}

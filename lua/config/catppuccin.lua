require("catppuccin").setup({
	flavor = "mocha",
	background = {
		dark = vim.g.neovide and "mocha" or "frappe",
	},
	term_colors = true,
	transparent_background = not vim.g.neovide,
	default_integrations = true,
	integrations = {
		treesitter = true,
		headlines = true,
		treesitter_context = true,
		notify = true,
		noice = true,
		mason = true,
		copilot_vim = true,
		neotree = true,
		dap = true,
		dap_ui = true,
		fzf = true,
		cmp = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		indent_blankline = {
			enabled = true,
			scope_color = "sap",
			colored_indent_levels = false,
		},
		rainbow_delimiters = true,
		which_key = true,
		markdown = true,
		dropbar = {
			enabled = true,
			color_mode = true,
		},
	},
})

vim.cmd.colorscheme("catppuccin")

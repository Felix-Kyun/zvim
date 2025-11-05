local run = require("utils.run")
return {
	{
		"williamboman/mason.nvim",
		config = run("config.lsp"),
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	"neovim/nvim-lspconfig",
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = run("config.completions"),
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"mfussenegger/nvim-lint",
	},
}

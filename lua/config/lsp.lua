-- mason related
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls" },
	auto_install = true,
})

-- nvim-java
-- require("java").setup({})

-- lsp config
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local setup_lsp = require("utils.setup_lsp")
local default = {
	capabilities = capabilities,
}
local map = {
	"lua_ls",
	"ts_ls",
	"pyright",
	"clangd",
	"emmet_language_server",
	"html",
	"bashls",
	"pylsp",
	"gopls",
}

setup_lsp(map, default)

-- linting
vim.env.ESLINT_D_PPID = vim.fn.getpid()
require("lint").linters_by_ft = {
	javascript = {
		"eslint_d",
	},
	typescript = {
		"eslint_d",
	},
	javascriptreact = {
		"eslint_d",
	},
	typescriptreact = {
		"eslint_d",
	},
}

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

require("ufo").setup({
	close_fold_kinds_for_ft = { default = {} },
})

-- none ls
local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")
mason_null_ls.setup({
	ensure_installed = { "stylua", "prettier", "clang-format", "checkmake" },
	automatic_installation = true,
})
null_ls.setup({
	sources = {
		-- formatters
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.checkmake,
	},
})

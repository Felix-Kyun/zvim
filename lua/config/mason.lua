-- mason related
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls" },
	auto_install = true,
})

-- lsp config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.ts_ls.setup({
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	capabilities = capabilities,
})

lspconfig.clangd.setup({
  capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
  capabilities = capabilities,
})

lspconfig.html.setup({
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})


-- none ls
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- formatters
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
-- 		-- null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.codespell,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.diagnostics.checkmake,
		require("none-ls.code_actions.eslint_d").with({ condition = require("utils.has_eslint_config") }),
		require("none-ls.diagnostics.eslint_d").with({ condition = require("utils.has_eslint_config") }),
		require("none-ls.formatting.eslint_d").with({ condition = require("utils.has_eslint_config") }),
    -- require("none-ls.diagnostics.ruff"),
    -- require("none-ls.formatting.ruff"),

	},
})


require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
})

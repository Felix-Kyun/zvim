local config = require("config.config")
local setup_lsp = require("utils.setup_lsp")
local extractKeys = require("utils.extractKeys")

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

mason.setup()
require("mason-lspconfig").setup({
	ensure_installed = extractKeys(config.lsp_servers),
	auto_install = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

require("ufo").setup({
	close_fold_kinds_for_ft = { default = {} },
})

local default = {
	capabilities = capabilities,
}

setup_lsp(config.lsp_servers, default)

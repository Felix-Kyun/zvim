local extractKeys = require("utils.extractKeys")
local get_null_ls_sources = require("utils.get_null_ls_sources")
local config = require("config.config")

-- none ls
local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	error("null-ls not found")
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	error("mason-null-ls not found")
end

mason_null_ls.setup({
	ensure_installed = extractKeys(config.null_ls_sources),
	automatic_installation = true,
})

null_ls.setup({
	sources = get_null_ls_sources(),
})

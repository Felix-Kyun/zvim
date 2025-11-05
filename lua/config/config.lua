local config = {}

config.lsp_servers = {
	"lua_ls",
	["ts_ls"] = {
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	},
	"clangd",
	"emmet_language_server",
	"html",
	"bashls",
	-- "pyright",
	-- "pylsp",
	-- "gopls",
}

config.null_ls_sources = {
	["stylua"] = "formatting.stylua",
	["prettier"] = "formatting.prettier",
	["clang-format"] = "formatting.clang_format",
	["checkmake"] = "diagnostics.checkmake",
}

return config

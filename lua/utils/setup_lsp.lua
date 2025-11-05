--[[
-- example map
   local map = {
    "lua_ls",
    "bash_ls",
    "clangd",
    ["eslint"] = {
    ...smth different here
    }
   }

   default = {
   capabilities = capabilities,
  }
--]]

local lsp = vim.lsp

return function(map, default)
	for key, value in pairs(map) do
		if type(key) == "number" then
			lsp.enable(value)
			lsp.config(value, default)
		else
			lsp.enable(key)
			local custom_on_attach = value.on_attach
			if custom_on_attach then
				value.on_attach = function(client, bufnr)
					local ok = pcall(custom_on_attach, client, bufnr)
					if not ok then
						vim.notify("Error in custom on_attach for " .. key, vim.log.levels.ERROR)
					end
					if default.on_attach then
						default.on_attach(client, bufnr)
					end
				end
			end
			lsp.config(key, value)
		end
	end
end

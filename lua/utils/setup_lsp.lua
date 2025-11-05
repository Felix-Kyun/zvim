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
			lsp.config(key, value)
		end
	end
end

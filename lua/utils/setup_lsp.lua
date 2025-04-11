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
local lspconfig = require("lspconfig")

return function (map, default)
  for key, value in pairs(map) do
    if type(value) == "table" then
      lspconfig[key].setup(value)
    else
      lspconfig[value].setup(default)
    end
  end
end

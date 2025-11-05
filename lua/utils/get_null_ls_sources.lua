local config = require("config.config")

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	return
end

return function()
	local sources = {}
	for _, source in pairs(config.null_ls_sources) do
		local builtin = null_ls.builtins
		local category, name = source:match("^(%w+)%.(.+)$")
		if category and name and builtin[category] and builtin[category][name] then
			table.insert(sources, builtin[category][name])
		end
	end

	return sources
end

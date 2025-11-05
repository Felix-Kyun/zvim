-- extracts keys from a table and returns them as an array
return function(t)
	local keys = {}
	for key, value in pairs(t) do
		if type(key) == "number" then
			table.insert(keys, value)
		else
			table.insert(keys, key)
		end
	end

	return keys
end

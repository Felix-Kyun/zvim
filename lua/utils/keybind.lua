-- bind.nvim v0.3
--[[
  this function expects a keymap table in the following schema:
  keybind_map = {
    mode = {
      {"keys", "cmd", "description"},
      {{ "key1", "key2" }, "cmd", "description"},
      { "keys", "cmd", { desc = "", noremap = true, ... } },
      [opts_all = { silent = true, ... }]
    },
    [{"v", "n"}] = { ... }
  }
   wherein for  each of the binds the following command will be executed
   vim.keybind.set(mode, key, cmd, { ...opts_all, ...opts })
   where opts will override opts_all
]]

local unpack = table.unpack or unpack

return function(keybind_map)
	-- for every mode block
	for mode, block in pairs(keybind_map) do
		-- for every keybind in the block
		for _, bind in ipairs(block) do
			-- destructure
			local key, cmd, opts = unpack(bind)

			-- check if the third argument is a string
			-- if then it is the description of the keybind
			if type(opts) == "string" then
				opts = { desc = opts }
			end

			-- error checking
			if not key then
				return error("[bind.lua] expected key as string or string[] but got nil")
			end
			if not cmd then
				return error("[bind.lua] expected string/function as cmd but got nil")
			end

			-- copy and override the opts for each keybind
			local final_opts = {}
			for k, v in pairs(block.opts or {}) do
				final_opts[k] = v
			end
			for k, v in pairs(opts or {}) do
				final_opts[k] = v
			end

			-- check if key is a table or just a string
			if type(key) == "table" then
				for _, k in ipairs(key) do
					vim.keymap.set(mode, k, cmd, final_opts)
				end
			else
				vim.keymap.set(mode, key, cmd, final_opts)
			end
		end
	end
end

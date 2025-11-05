-- Set up nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")

-- setup friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			elseif vim.b._copilot_suggestion ~= nil then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn["copilot#Accept"](), true, true, true), "")
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {

		{ name = "buffer" },
		{ name = "path" },
	}),
	experimental = {
		ghost_text = true,
	},
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		mode = "symbol_text",
	-- 		maxwidth = {
	--
	-- 			menu = 50,
	-- 			abbr = 50,
	-- 		},
	-- 		ellipsis_char = "...",
	-- 		show_labelDetails = true,
	-- 		before = function(entry, vim_item)
	-- 			-- ...
	-- 			return vim_item
	-- 		end,
	-- 	}),
	-- },
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local color_item = require("nvim-highlight-colors").format(entry, { kind = vim_item.kind }) -- css colors
			local kind = require("lspkind").cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
			})(entry, vim_item) -- lspkind

			-- apply color
			if color_item.abbr_hl_group then
				vim_item.kind_hl_group = color_item.abbr_hl_group
				vim_item.kind = color_item.abbr
			end

			-- extra formatting for lspkind
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

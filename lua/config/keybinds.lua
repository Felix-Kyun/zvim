local bind = require("utils.keybind")
local neovide = require("utils.neovide")

bind({
	n = {
		{ "<C-n>", ":Neotree toggle<CR>", "opens the file tree to the right" },
		{ "<leader>z", ":ZenMode<CR>", "Toggle Zen Mode" },
		{ "<leader>T", ":Twilight<CR>", "Toggle Twilight Mode" },
		{ "<leader>m", ":Maximize<CR>", "Toggle Window Maximize Mode" },
		{ "<leader>r", ":RestNvim<CR>", "runs the selected rest api request" },
		{ "<Tab>", ":tabnext<CR>", "switch to next buffer" },
		{ "<S-Tab>", ":tabprevious<CR>", "switch to previous buffer" },
		{ "<leader>t", ":tabnew<CR>", "create new tab" },
		{ "gs", ":SplitjoinSplit<CR>", "split single line into multiple lines" },
		{ "gj", ":SplitjoinJoin<CR>", "split multiple lines into one line" },
		opts = { silent = true, noremap = true },
	},
})

--[[ plugin related ]]
-- dropbar
local dropbar = require("dropbar.api")
bind({
	n = {
		{ "<leader>;", dropbar.pick },
		{ "[;", dropbar.goto_context_start },
		{ "];", dropbar.select_next_context },
	},
})

-- lsp related
local buf = vim.lsp.buf
bind({
	n = {
		{ "K", buf.hover },
	},
	[{ "n", "v" }] = {
		{ "<leader>ca", buf.code_action, "Code Actions" },
		{ "<leader>fmt", buf.format, "Format Code" },
		{ "<leader>gd", buf.definition, "Show Defination" },
		{ "<leader>gr", buf.references, "Show References" },
		{ "<leader>gi", buf.implementation, "Show Implementation" },
		{ "<leader>rn", buf.rename, "Rename Symbol" },
	},
})

-- window navigation
bind({
	n = {
		{ "<C-h>", "<C-w>h", "Navigate Left" },
		{ "<C-j>", "<C-w>j", "Navigate Down" },
		{ "<C-k>", "<C-w>k", "Navigate Up" },
		{ "<C-l>", "<C-w>l", "Navigate Right" },
	},
	opts = { silent = true, noremap = true },
})

-- clipboard
bind({
	[{ "n", "v", "t" }] = {
		{ "<SC-C>", '"+y', "Yank to system clipboard" },
		{ "<SC-V>", '"+p', "Paste from system clipboard" },
		{ "<SC-X>", '"+d', "Cut to system clipboard" },
	},
	[{ "i" }] = {
		{ "<SC-V>", '<C-r>"+<C-o>p', "Yank to system clipboard" },
	},
})

bind({
	n = {
		{ "<leader>ls", ":AutoSession search<CR>", "opens the saved session selector" },
		{ "<leader>ss", ":AutoSession save<CR>", "saves the current session" },
		{ "<leader>sd", ":AutoSession delete<CR>", "deletes the current session" },
	},
})

-- fzf lua
bind({
	n = {
		{ "<leader>ff", ":FzfLua files<CR>", "Find Files" },
		{ "<leader>fd", ":FzfLua live_grep<CR>", "Live Grep" },
		{ "<C-P>", ":FzfLua buffers<CR>", "List Buffers" },
		{ "<leader>fh", ":FzfLua help_tags<CR>", "Help Tags" },
		{ "<leader>fc", ":FzfLua commands<CR>", "Commands" },
	},
})

-- terminal
bind({
	t = {
		{ "<esc>", require("toggleterm").toggle, "closes the terminal in floating pane" },
		{ "<C-t>", require("toggleterm").toggle, "closes the terminal in floating pane" },
	},

	n = {
		{ "<C-t>", "<esc>:ToggleTerm direction=float<CR>", { desc = "opens the terminal in floating pane" } },
	},
})

if vim.g.neovide then
	bind({
		[{ "n", "v" }] = {
			{
				{ "<C-+>", "<C-ScrollWheelUp>" },
				neovide.scale.increase,
				"Increase Neovide Scale Factor",
			},
			{
				{ "<C-->", "<C-ScrollWheelDown>" },
				neovide.scale.decrease,
				"Decrease Neovide Scale Factor",
			},
			{
				"<C-0>",
				neovide.scale.reset,
				"Reset Neovide Scale Factor",
			},
		},
	})
end

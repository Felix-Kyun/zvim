local bind = require("utils.keybind")

bind({
	n = {
		{ "<C-N>", ":Neotree toggle<CR>", "opens the file tree to the right" },
		{
			"<C-P>",
			":FzfLua buffers<CR>",
			"opens the currently open buffers in a floating pane" ,
		},
		{ "<leader>ff", ":FzfLua files<CR>", "opens the file finder"  },
		{ "<leader>fd", ":FzfLua live_grep<CR>", "opens the live grep"  },
		{ "<C-\\>", "<esc>:ToggleTerm direction=float<CR>", { desc = "opens the terminal in floating pane" } },
		{ "<leader>ls", ":SessionSearch<CR>", "opens the saved session selector"  },
		{ "<leader>ss", ":SessionSave<CR>", "saves the current session"  },
		{ "<leader>sd", ":SessionDelete<CR>", "deletes the current session"  },
		{ "<leader>z", ":ZenMode<CR>", "Toggle Zen Mode"  },
		{ "<leader>T", ":Twilight<CR>", "Toggle Twilight Mode"  },
		{ "<leader>m", ":Maximize<CR>", "Toggle Window Maximize Mode"  },
    { "<leader>r", ":RestNvim<CR>", "runs the selected rest api request"  },
    { "<Tab>", ":tabnext<CR>", "switch to next buffer"  },
    { "<S-Tab>", ":tabprevious<CR>", "switch to previous buffer"  },
    { "<leader>t", ":tabnew<CR>", "create new tab"  },
    -- { "<leader>r", ":Rest run<CR>", "runs the selected rest api request"  },
    { "gs", ":SplitjoinSplit<CR>", "split single line into multiple lines"  },
    { "gj", ":SplitjoinJoin<CR>", "split multiple lines into one line"  },
		opts = { silent = true, noremap = true },
	},
  [{"t"}] = {
		{ "<esc>", require "toggleterm".toggle, "closes the terminal in floating pane"  },
		{ "<C-\\>", require "toggleterm".toggle, "closes the terminal in floating pane"  },
  }
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
		{ "<leader>ca", buf.code_action, "Code Actions"  },
		{ "<leader>fmt", buf.format, "Format Code"  },
		{ "<leader>gd", buf.definition, "Show Defination"  },
	},
})

-- nvim cmp
-- local cmp = require("cmp")
-- bind({
-- 	i = {
-- 		{
-- 			"<C-y>",
-- 			cmp.mapping.confirm({ select = true }),
-- 			{ desc = "Confirm slected completions" },
-- 		},
-- 		{ "<C-Space>", cmp.mapping.complete(), "Auto complete"  },
-- 		{
-- 			"<C-e>",
-- 			cmp.mapping.abort(),
-- 			{ desc = "Abort Selection" },
-- 		},
--
-- 		{ "<C-b>", cmp.mapping.scroll_docs(-4), "Scroll doc up"  },
-- 		{ "<C-f>", cmp.mapping.scroll_docs(4), "Scroll doc down"  },
-- 		opts = { silent = true, noremap = true },
-- 	},
-- })

-- tmux navigator 
bind({
  n = {
    { "<C-h>", ":TmuxNavigateLeft<cr>", "Navigate Left"  },
    { "<C-j>", ":TmuxNavigateDown<cr>", "Navigate Down"  },
    { "<C-k>", ":TmuxNavigateUp<cr>", "Navigate Up"  },
    { "<C-l>", ":TmuxNavigateRight<cr>", "Navigate Right"  },
  },
  opts = { silent = true, noremap = true },
})

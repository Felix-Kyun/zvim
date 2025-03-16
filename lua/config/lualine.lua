local lualine_noice = {
  require("noice").api.statusline.mode.get,
  cond = require("noice").api.statusline.mode.has,
  color = { fg = "#ff9e64" },
}

local lualine_tabs = {
  "tabs",
  max_length = vim.o.columns,
  mode = 2,
  path = 0,
  use_mode_colors = true,
}

require("lualine").setup({
  theme = "catppuccin",
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "lsp_status", lualine_noice, "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {
    lualine_a = { lualine_tabs },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})

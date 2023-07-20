--[[ return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require 'highlights'
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    }
  },
} ]]

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.5

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    vim.cmd [[hi FloatBorder guibg=NONE]]
    vim.cmd [[hi NormalFloat guibg=NONE]]

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
        custom = {
          "^.git$"
        },
      },
    })
  end
}

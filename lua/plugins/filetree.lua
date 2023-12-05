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
      disable_netrw = true,
      hijack_netrw = true,
      sort_by = "case_sensitive",
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      view = {
        relativenumber = true,
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
        full_name = true,
        group_empty = true,
        special_files = {},
        symlink_destination = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "signcolumn",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "help" },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      actions = {
        change_dir = {
          enable = false,
          restrict_above_cwd = true,
        },
        open_file = {
          resize_window = true,
          window_picker = {
            chars = "aoeui",
          },
        },
        remove_file = {
          close_window = false,
        },
      },
      log = {
        enable = false,
        truncate = true,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
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

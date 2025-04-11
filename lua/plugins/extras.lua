local run = require("utils.run")

return {

  -- tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    enabled = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = run("config.treesitter"),
  },

  -- session
  {
    "rmagatti/auto-session",
    lazy = false,

    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },

  -- markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- copilot
  "github/copilot.vim",

  -- comment
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- autopair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- trouble
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },

  -- codesnap
  {
    "mistricky/codesnap.nvim",
    opts = {
      has_breadcrumbs = true,
      has_line_numbers = true,
      bg_theme = "summer",
      watermark = "",
      bg_padding = 10,
    },
    build = "make",
  },
  {
    "AndrewRadev/splitjoin.vim",
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  -- {
  --   "rest-nvim/rest.nvim",
  -- },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
    },
  },
  {
    "declancm/maximize.nvim",
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = run("config.ufo"),
  },
}

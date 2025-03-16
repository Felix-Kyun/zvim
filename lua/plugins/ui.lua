local run = require("utils.run")
return {

  -- theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = true, -- somehow this setting lazy = true causes it to not load properly
    config = run("config.catppuccin"),
    priority = 1000,
  },

  -- noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.lazyredraw = false
    end,
    opts = run("config.noice"),
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000",
          top_down = false,
        },
      },
    },
  },

  -- dropbar
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  -- indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = run("config.lualine"),
  },

  -- rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
  },

  -- fzf
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = run("config.fzf-lua"),
  },

  -- file tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    config = run("config.neotree"),
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- which_key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
  },

  -- lksp progress
  -- {
  -- 	"linrongbin16/lsp-progress.nvim",
  -- 	config = function()
  -- 		require("lsp-progress").setup()
  -- 	end,
  -- },

  -- lsp related maybe
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    },
  },

  -- copilot chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                    -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
    opts = {},
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },
}

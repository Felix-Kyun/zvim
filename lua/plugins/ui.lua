return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require 'config.which-key'
    end,
  },
  {
    'shaunsingh/nord.nvim',
    config = function()
      require 'config.nord'
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require 'config.indent'
    end

  },
  'nvim-tree/nvim-web-devicons',
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'config.lualine'
    end
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require 'config.buffer'
    end
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require 'config.mini'
    end
  },
  {
    "onsails/lspkind.nvim",
    --[[ config = function()
      require 'config.kind'
    end ]]
  }

}

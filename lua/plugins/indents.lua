local function set_highlight(prefix, color_table)
  for name, hex in pairs(color_table) do
    vim.api.nvim_set_hl(0, prefix .. name, { fg = hex })
  end
end

local highlight_list = {
  'RainbowCyan',
  'RainbowBlue',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowYellow',
  'RainbowOrange',
  'RainbowRed',
}

local color_list = {
  Red = '#BF616A',
  Orange = '#D08770',
  Yellow = '#EBCB8B',
  Green = '#A3BE8C',
  Cyan = '#88C0D0',
  Blue = '#5E81AC',
  Violet = '#B48EAD',
}

local indent_highlight = {
  "CursorColumn",
  "Whitespace",
}

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    main = 'ibl',
    opts = {},
    config = function()
      local hooks = require "ibl.hooks"

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        set_highlight("Rainbow", color_list)
      end)

      require 'ibl'.setup {
        scope = {
          highlight = highlight_list,
          show_start = true,
        },
      }
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  },
  {
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = highlight_list,
      }
    end
  }
}

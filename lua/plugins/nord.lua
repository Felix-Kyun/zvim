-- nord themeing
return {
  {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = true

      require('nord').set()
    end,
  },

}

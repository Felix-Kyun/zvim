return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.starter').setup()
      require('mini.splitjoin').setup()
      require('mini.pairs').setup()
    end
  },
}

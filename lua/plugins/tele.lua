return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      extensions = {
        persisted = {
          layout_config = { width = 0.55, height = 0.55 }
        }
      }
    })
  end
}

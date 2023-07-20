return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.splitjoin').setup()
      require('mini.pairs').setup()


      --start config
      local starter = require 'mini.starter'
      starter.setup {
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning('center', 'center'),
        },
        items = {
          starter.sections.builtin_actions(),
          -- starter.sections.telescope(),
          starter.sections.recent_files(5, false),
        },
      }
    end
  },
}

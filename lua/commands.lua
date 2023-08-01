vim.api.nvim_create_user_command(
  'ToggleDapui',
  'lua require "dapui".toggle()',
  {
    nargs = 0,
  }
)

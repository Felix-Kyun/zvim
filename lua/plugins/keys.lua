return {
  {
    'LionC/nest.nvim',
    config = function()
      local nest = require 'nest'

      nest.applyKeymaps {
        --{{{ leader
        {
          '<leader>',
          {
            { '?',     ':WhichKey<CR>' },
            { 's',     ':source %<CR>' },
            { 'ff',    ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>' },
            { 'fd',    ':Telescope live_grep<CR>' },
            { 'u',     ':Lazy<CR>' },
            { 'e',     ':TroubleToggle<CR>' },
            { 'zn',    ':TZNarrow<CR>' },
            { 'zf',    ':TZFocus<CR>' },
            { 'zm',    ':TZMinimalist<CR>' },
            { 'za',    ':TZAtaraxis<CR>' },
            { 'qs',    [[<cmd>lua require("persistence").load()<cr>]] },
            { 'ql',    [[<cmd>lua require("persistence").load({ last = true })<cr>]] },
            { 'qd',    [[<cmd>lua require("persistence").stop()<cr>]] },
            { '<Tab>', '<C-w>w' },
            { 'a',     '<C-w>h' },
            { 's',     '<C-w>j' },
            { 'w',     '<C-w>k' },
            { 'd',     '<C-w>l' },
          },
          options = {
            silent = false
          }
        },
        -- }}}

        --{{{ control
        { '<C-n>', '<CMD>:NvimTreeToggle<CR>',        options = { silent = false } },
        { '<C-`>', ':ToggleTerm direction=float<CR>', options = { silent = false } },
        -- }}}

        --{{{ insert mode
        {
          mode = 'i',
          { 'jk',     '<ESC>' },
          { '<C-h>',  '<C-o>h' },
          { '<C-l>',  '<C-o>l' },
          { '<C-j>',  '<C-o>j' },
          { '<C-k>',  '<C-o>k' },
          { '<C-BS>', '<C-w>' },
        },
        --}}}

        --{{{ visual mode
        {
          mode = 'v',
          { '<leader>zn', ":'<,'>TZNarrow<CR>" },
        },
        --}}}

        --{{{tab
        { '<Tab>',   ':BufferLineCycleNext<CR>' },
        { '<S-Tab>', ':BufferLineCyclePrev<CR>' },
        --}}}

        --{{{misc
        { '<up>',    '<nop>' },
        { '<down>',  '<nop>' },
        { '<left>',  '<nop>' },
        { '<right>', '<nop>' },
        { "<A-h>",   '<CMD>NavigatorLeft<CR>' },
        { "<A-l>",   '<CMD>NavigatorRight<CR>' },
        { "<A-k>",   '<CMD>NavigatorUp<CR>' },
        { "<A-j>",   '<CMD>NavigatorDown<CR>' },
        { "<A-p>",   '<CMD>NavigatorPrevious<CR>' },
        --}}}
        --{{{
        { '<S-j>',   ':HopWordAC<CR>' },
        { '<S-k>',   ':HopWordBC<CR>' },
        --}}}
        { ';;',      ':q<CR>' },
      }
    end,
  }
}

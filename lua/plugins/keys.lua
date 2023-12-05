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
            { 'so',    ':source %<CR>' },
            { 'ss',    ':SessionSave<CR>' },
            { 'sd',    ':SessionDelete<CR>' },
            { 'sr',    ':SessionLoadLast<CR>' },
            { 'sf',    ':lua require("auto-session.session-lens").search_session <CR>' },
            { 'ff',    ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>' },
            { 'fd',    ':Telescope live_grep<CR>' },
            { 'u',     ':Lazy<CR>' },
            { 'e',     ':TroubleToggle<CR>' },
            { 'zn',    ':TZNarrow<CR>' },
            { 'zf',    ':TZFocus<CR>' },
            { 'zm',    ':TZMinimalist<CR>' },
            { 'za',    ':TZAtaraxis<CR>' },
            { '<Tab>', '<C-w>w' },
            { 'h',     '<C-w>h' },
            { 'j',     '<C-w>j' },
            { 'k',     '<C-w>k' },
            { 'l',     '<C-w>l' },
            { 't',     ':Twilight<CR>' },
            { 'b',     '`.' },
            { 'fmt',   ':lua vim.lsp.buf.format()<CR>' },
            { 'au',    ':ArduinoUpload<CR>' },
            { 'q',     ':q<CR>' },
            { 'dt',    ':DapToggleBreakpoint<CR>' },
            { 'dc',    ':DapContinue<CR>' },
          },
          options = {
            silent = false
          }
        },
        -- }}}

        --{{{ control
        { '<C-n>', '<CMD>:NvimTreeToggle<CR>',        options = { silent = false } },
        { '<C-`>', ':ToggleTerm direction=float<CR>', options = { silent = false } },
        { '<C-s>', ':Telescope persisted<CR>' },
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

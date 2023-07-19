return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = vim.log.levels.ERROR,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      auto_session_use_git_branch = false,
      auto_restore_enabled = false,
      session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    }
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
  end
}

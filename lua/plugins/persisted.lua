return {
  "olimorris/persisted.nvim",
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    require("persisted").setup({
      save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
      silent = false,                                                   -- silent nvim message when sourcing session file
      use_git_branch = false,                                           -- create session files based on the branch of the git enabled repository
      autosave = true,                                                  -- automatically save session files when exiting Neovim
      should_autosave = function()
        -- disable auto save if mini.started is active
        if vim.bo.filetype == 'starter' then
          return false
        end

        -- disable auto save for specific dirs
        local working_dir = vim.fn.getcwd()
        local non_permitted_working_dir = {
          "/",
          "/home/felix",
          "~/Downloads/",
        }
        local final_dir = {}
        for _, v in pairs(non_permitted_working_dir) do
          final_dir[v] = v
        end
        if final_dir[working_dir] then
          return false
        end

        -- if nothign then return true to auto save
        return true
      end,                                  -- function to determine if a session should be autosaved
      autoload = false,                     -- automatically load the session for the cwd on Neovim startup
      on_autoload_no_session = nil,         -- function to run when `autoload = true` but there is no session to load
      follow_cwd = true,                    -- change session file name to match current working directory if it changes
      allowed_dirs = nil,                   -- table of dirs that the plugin will auto-save and auto-load from
      ignored_dirs = nil,                   -- table of dirs that are ignored when auto-saving and auto-loading
      telescope = {                         -- options for the telescope extension
        reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
      },
    })
    require("telescope").load_extension("persisted")
  end
}

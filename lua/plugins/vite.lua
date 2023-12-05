return {
  "liaohui5/vite-server.nvim",
  config = function()
    require("vite-server").setup({
      -- read vite documention: https://vitejs.dev/guide/cli.html
      -- only supported: port,open,force,cors,base,strictPort
      vite_cli_opts = {
        -- Note: The --strictPort parameter is added, https://v3.vitejs.dev/config/server-options.html#server-strictport
        --       If the strictPort parameter is not added, the obtained url will be inaccurate.
        --       so please ensure that the port is not useing
        port = 8888,
        open = true,
        force = true,
        cors = false,
        strictPort = true,
        base = "/",
      },
      show_cmd = true,            -- show execute command in message
      deatch_process_on_exit = false, -- see `:h jobstart-options` deatch option
      root_path = function()
        -- run vite command root directory, like ~/Desktop/codes

        -- project root directory
        -- return vim.fn.getcwd()

        -- current file directory (default)
        return vim.fn.expand("%:p:h")
      end,
      hooks = {
        -- after server started
        on_started = nil, --- or function(job_id, config) end,

        -- :h jobstart-options
        on_stdout = nil,
        on_exit = function(_, exit_code)
          if exit_code == 0 then
            print("server stoped")
          end
        end,

        on_stderr = function(_, data)
          print("an error has occurred")
        end,
      },
    })
  end
}

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { "onsails/lspkind.nvim" },
    {                            -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    {

      {
        "mfussenegger/nvim-dap",
        config = function()
          require 'dap_config.c'
        end
      },
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          local dapui = require("dapui")
          dapui.setup {}
          local dap = require 'dap'
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require("nvim-dap-virtual-text").setup()
        end
      }
    },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-path' },     -- Required
    { 'hrsh7th/cmp-buffer' },   -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'L3MON4D3/LuaSnip' }, -- Required
  },
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'minimal',
      manage_nvim_cmp = {
        set_sources = 'lsp',
        set_basic_mappings = true,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
      },
    })

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
      if client.server_capabilities["documentSymbolProvider"] then
        require("nvim-navic").attach(client, bufnr)
      end
    end)
    lsp.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['lua_ls'] = { 'lua' },
        ['clangd'] = { 'c' },
      }
    })

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    -- Configure prettierd
    -- require("lspconfig").prettierd.setup({
    --   -- capabilities = require('cmp_nvim_lsp').cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- })

    -- arduino lsp setup
    local fqbn =
    "esp8266:esp8266:nodemcuv2:baud=115200,wipe=none,vt=flash,mmu=3232,dbg=Disabled,lvl=None____,eesz=4M1M,non32xfer=fast,led=2,exception=disabled,ssl=basic,xtal=160,stacksmash=disabled,ip=lm2f"
    -- fqbn = "esp8266:esp8266:nodemcuv2"
    require 'lspconfig'.arduino_language_server.setup {
      cmd = {
        "arduino-language-server",
        "-cli-config", "/path/to/arduino-cli.yaml",
        "-fqbn",
        fqbn
      }
    }

    lsp.setup()
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    require('luasnip.loaders.from_vscode').lazy_load()
    local lspkind = require('lspkind')

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',                 keyword_length = 3 },
        { name = 'luasnip',                keyword_length = 2 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua',               keyword_length = 2 },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            symbol_map = {
              Text = "󰉿",
              Method = "󰆧",
              Function = "󰊕",
              Constructor = "",
              Field = "󰜢",
              Variable = "󰀫",
              Class = "󰠱",
              Interface = "",
              Module = "",
              Property = "󰜢",
              Unit = "󰑭",
              Value = "󰎠",
              Enum = "",
              Keyword = "󰌋",
              Snippet = "",
              Color = "󰏘",
              File = "󰈙",
              Reference = "󰈇",
              Folder = "󰉋",
              EnumMember = "",
              Constant = "󰏿",
              Struct = "󰙅",
              Event = "",
              Operator = "󰆕",
              TypeParameter = "",
            },

          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },
      enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture("comment")
              and not context.in_syntax_group("Comment")
        end
      end,
      mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<C-y>'] = cmp.mapping.confirm({select = true}),
        -- ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      }
    })
    --[[ cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    }) ]]
    --[[ cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    }) ]]
  end,
}


--[[
 TODO:
navigator
gitsigns
hop.nvim/lead.nvim
vim surround
splitjoin
truezen
nvim-notify
nvim dap
glance.nvim

--]]

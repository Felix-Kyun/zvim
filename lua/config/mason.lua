-- mason related
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls" },
  auto_install = true,
})

-- lsp config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
local setup_lsp = require("utils.setup_lsp")
local default = {
  capabilities = capabilities,
}
local map = {
  "lua_ls",
  "ts_ls",
  "pyright",
  "clangd",
  "emmet_language_server",
  "html",
  "ccls",
  "bashls",

  ["eslint"] = {
    capabilities = capabilities,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    settings = {
      format = { enable = true },
      codeAction = { enable = true },
      lint = { enable = true },
      workingDirectory = { mode = "auto" },
    },
  },
}

setup_lsp(map, default)
require("ufo").setup({
  close_fold_kinds_for_ft = { default = {} },
})

-- none ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- formatters
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.diagnostics.checkmake,
  },
})

require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = true,
})

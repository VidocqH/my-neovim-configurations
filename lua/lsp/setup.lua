vim.lsp.set_log_level("debug")

-- Installer List
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: language value: config file }
local servers = {
  sumneko_lua = require "lsp.lua-lsp-config", -- ./lua/lsp/lua-lsp-config.lua
  pyright = {},
  remark_ls = {},
  tsserver = {},
  cmake = {},
  jsonls = {},
  bashls = {},
  html = {},
  volar = {},
  yamlls = {},
  dockerls = {},
  grammarly = {},
  lemminx = {}
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Bind shortcut
  require('keybindings').maplsp(buf_set_keymap)
  require("aerial").on_attach(client, bufnr)    -- Aerial LSP Support
end

for lang, config in pairs(servers) do
  require("lspconfig")[lang].setup {
    on_attach = on_attach,
    settings = config.settings
  }
end

require("clangd_extensions").setup {
  server = {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150, },
    -- cmd = {
    --   "clangd",
    --   "-j=8",
    --   "--background-index",
    --   "--clang-tidy",
    --   "--fallback-style=llvm",
    --   "--all-scopes-completion",
    --   "--completion-style=detailed",
    --   "--header-insertion=iwyu",
    --   "--header-insertion-decorators",
    --   "--pch-storage=memory",
    -- }
  },
}


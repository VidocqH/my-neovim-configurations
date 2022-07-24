vim.lsp.set_log_level("debug")
local lsp_installer = require "nvim-lsp-installer"

-- Installer List
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: language value: config file }
local servers = {
  sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
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

-- Auto Install LanguageServers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Bind shortcut
  require('keybindings').maplsp(buf_set_keymap)
  require("aerial").on_attach(client, bufnr)    -- Aerial LSP Support
end

lsp_installer.on_server_ready(function(server)
  local opts = servers[server.name] or {}
  opts.on_attach = on_attach
  opts.flags = {
    debounce_text_changes = 150,
  }
  server:setup(opts)
end)

require("clangd_extensions").setup {
  server = {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150, },
    cmd = {
      "clangd",
      "-j=8",
      "--background-index",
      "--clang-tidy",
      "--fallback-style=llvm",
      "--all-scopes-completion",
      "--completion-style=detailed",
      "--header-insertion=iwyu",
      "--header-insertion-decorators",
      "--pch-storage=memory",
    }
  },
}

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

lsp_installer.on_server_ready(function(server)
  local opts = servers[server.name] or {}
  if server.name == 'clangd' then
    -- Clangd Extension Setup
    require "clangd_extensions".setup {}
    return
  end
  if opts then
    opts.on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      -- Bind shortcut
      require('keybindings').maplsp(buf_set_keymap)
    end
  end
  -- opts.flags = {
  --   debounce_text_changes = 150,
  -- }
  server:setup(opts)
end)

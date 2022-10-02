-- vim.lsp.set_log_level("debug")

-- Installer List
-- { key: language value: config file }
local lsp_servers = {
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
  lemminx = {},
  clangd = {},
  rust_analyzer = {},
  sqlls = {},
}

-- Diagnostics Sign
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({ virtual_text = { prefix = '●' } })

local dap_servers = {
  "debugpy",
  "vscode-node-debug2"
}

local function get_keys(t)
  local keys={}
  for key,_ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

-- Auto Install servers
require('mason-lspconfig').setup({
  ensure_installed = get_keys(lsp_servers)
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  require('keybindings').maplsp(buf_set_keymap) -- Bind shortcut
  require("aerial").on_attach(client, bufnr)    -- Aerial LSP Support
  require('nvim-navic').attach(client, bufnr)
end

-- cmp-nvim lsp setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Load installed lsp server
for lang, config in pairs(lsp_servers) do
  -- Clangd would be load by the clangd_extensions
  if lang ~= 'clangd' then
    require("lspconfig")[lang].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = config.settings
    }
  end
end

-- Load clangd lsp with extension
require("clangd_extensions").setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150, },
  },
}


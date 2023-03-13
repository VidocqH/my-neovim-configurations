-- vim.lsp.set_log_level("debug")

local function lsp_settings(server_name)
  if server_name == "lua_ls" then
    return require "lsp.lsp_settings.lua_ls"
  elseif server_name == "tsserver" then
    return require "lsp.lsp_settings.tsserver"
  end
  return {}
end

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

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  require("lsp-inlayhints").on_attach(client, bufnr)
  require('keybindings').maplsp(buf_set_keymap) -- Bind shortcut
end

-- cmp-nvim lsp setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
  function (server_name)
    if server_name ~= "clangd" then
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = lsp_settings(server_name)
      }
    end
  end
}

-- Load clangd lsp with extension
require("clangd_extensions").setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150, },
  },
}


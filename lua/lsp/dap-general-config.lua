local dap = require('dap')
if (vim.fn.has('osx') == 1) then
  -- For brew install llvm settings
  dap.adapters.lldb = {
    type = 'executable',
    -- command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    command = '/usr/local/opt/llvm/bin/lldb-vscode',
    name = 'lldb'
  }
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' }
  }
  dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host, port = config.port })
  end
end

local function inproject_dap_config_file_exists()   -- Project ./.nvim/dap-config.lua
   local f=io.open(vim.fn.getcwd() .. "/.nvim/dap-config.lua","r")
   if f~=nil then io.close(f) return true else return false end
end

if inproject_dap_config_file_exists() == true then
  dap.configurations.cpp = dofile(vim.fn.getcwd() .. "/.nvim/dap-config.lua")
else
  dap.configurations.cpp = require('lsp.cpp-dap-config')
end
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= "" then
        return value
      end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, "Please provide a port number")
      return val
    end,
  }
}

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = require('lsp.ts-dap-config')
end


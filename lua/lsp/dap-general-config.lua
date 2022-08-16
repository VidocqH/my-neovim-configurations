local dap = require('dap')
if (vim.fn.has('osx') == 1) then
  -- For brew install llvm settings
  dap.adapters.lldb = {
    type = 'executable',
    -- command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    command = '/usr/local/opt/llvm/bin/lldb-vscode',
    name = 'lldb'
  }
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

-- -- If you want to use this for Rust and C, add something like this:
--
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

IS_VSCODE = vim.fn.exists('g:vscode') == 1 and true or false
IS_NEOVIDE = vim.fn.exists('g:neovide') == 1 and true or false
IS_WINDOWS = vim.fn.has('win32') == 1 and true or false
IS_OSX = vim.fn.has('osx') == 1 and true or false

require('basic')
require('plugins')
-- Currently doesn't have a beautiful solution for vscode checking. 'cond' option
-- plugins that mess vscode with nvim plugins
if IS_VSCODE == false then
  require('keybindings')
  require('plugin-config/nvim-theme-config')
  require('plugin-config/auto-session-config')
  require('plugin-config/nvim-treesitter-config')
  ---
  require'neodev'.setup({})
  require'neoconf'.setup({})
  ---
  require('lsp/setup')
  require('lsp/nvim-cmp')
  require('lsp/lsp-sage')
  require('lsp/dap-general-config')
  require('lsp/linter-formatter')
  require('lsp/neotest')
  require('lsp/copilot')
  require('plugin-config/indent-blankline-config')
  require('plugin-config/symbols-outline-config')
  require('plugin-config/nvim-ide-config')
  require('plugin-config/nvim-tree-config')
  require('plugin-config/bufferline')
  require('plugin-config/gitsigns-config')
  require('plugin-config/toggleterm-config')
  require('plugin-config/telescope-config')
  require('plugin-config/dashboard-nvim-config')
  require('plugin-config/lualine-config')
  require('plugin-config/mini-animate')
  require('highlight')
end
if IS_NEOVIDE then
  require('neovide')
end
require('plugin-config/discord-presence')
require('plugins_with_default_start')
require('autocmd')


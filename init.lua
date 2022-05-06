require('basic')
require('keybindings')
-- Currently doesn't have a beautiful solution for vscode checking. 'cond' option
-- under Packer mess theme plugin.
if vim.fn.exists('g:vscode') == 0 then
  require('plugin-config/nvim-theme-config')
end
require('plugin-config/lualine-config')
require('plugin-config/nvim-gps-config')
require('plugin-config/nvim-treesitter-config')
require('plugin-config/nvim-tree-config')
require('plugin-config/bufferline')
require('lsp/setup')
require('lsp/nvim-cmp')
require('lsp/lsp-sage')
require('plugin-config/comment-config')
require('plugin-config/colorizer-config')
require('plugin-config/dashboard-nvim-config')
require('plugin-config/gitsigns-config')
require('plugin-config/indent-blankline-config')
require('plugin-config/symbols-outline-config')
require('plugin-config/toggleterm-config')
require('plugin-config/mini-config')
require('plugin-config/telescope-config')
require('plugin-config/sniprun-config')
require('plugins')
require('autocmd')

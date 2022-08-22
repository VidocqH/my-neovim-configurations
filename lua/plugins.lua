local noVSCode = function()
  return vim.fn.exists('g:vscode') == 0
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- print(noVSCode())

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- OneDarkPro Theme
  use {
    'olimorris/onedarkpro.nvim',
    -- cond = { noVSCode },
  }
  -- Bottom Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Sidebar File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons' -- optional, for file icon
  }
  -- Highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- Context
  use { 'nvim-treesitter/nvim-treesitter-context' }
  -- Tab
  use { 'romgrk/barbar.nvim', requires='kyazdani42/nvim-web-devicons' }
  -- Github Copilot
  use { 'github/copilot.vim' }
  -- LSP Server
  use { 'neovim/nvim-lspconfig' }
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'
  -- lsp sage
  use 'tami5/lspsaga.nvim'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- surround
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup { mappings_style = "surround" }
    end
  }
  -- comment
  use "terrortylor/nvim-comment"
  -- colorizer
  use "norcalli/nvim-colorizer.lua"
  -- Hop - EasyMotion
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  -- Dashboard
  use { "glepnir/dashboard-nvim" }
  -- Floating Terminal
  use "voldikss/vim-floaterm"
  -- Lines or paragraphs move up and down
  use "fedepujol/move.nvim"
  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }
  -- Indent Colorful Lines
  use "lukas-reineke/indent-blankline.nvim"
  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  -- Symbols Outline
  use "stevearc/aerial.nvim"
  -- Terminal tab
  use { "akinsho/toggleterm.nvim", tag = "v2.*" }
  -- mini, multiple functionalities
  use { 'echasnovski/mini.nvim', branch = 'stable' }
  -- Notify
  use 'rcarriga/nvim-notify'
  -- Snippet Code Runner
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}
  -- LuaLine scope
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }
  -- Rainbow parentheses
  use { "p00f/nvim-ts-rainbow" }
  -- Auto pairs
  use { "jiangmiao/auto-pairs" }
  -- Auto Session
  use { 'rmagatti/auto-session' }
  -- Clangd Extension
  use { 'p00f/clangd_extensions.nvim' }
  -- Discord Rich Presence
  use { 'andweeb/presence.nvim' }
  -- Lsp progress display
  use {
    'j-hui/fidget.nvim',
    config = function()
      require"fidget".setup {}
    end,
    after = "nvim-lspconfig"
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  -- Mason
  use {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  }
  use { 'williamboman/mason-lspconfig.nvim' }
  -- Debugger
  use {
    'mfussenegger/nvim-dap'
  }
  -- Debugger for Python
  use {
    'mfussenegger/nvim-dap-python',
    config = function()
      require('dap-python').setup()
    end
  }
  -- Debugger UI
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function ()
      require('dapui').setup()
    end
  }
  -- Debugger Virtual text
  use {
    'theHamsta/nvim-dap-virtual-text',
    config = function ()
      require('nvim-dap-virtual-text').setup()
    end
  }
  -- Debugger telescope plugin
  use { 'nvim-telescope/telescope-dap.nvim' }
  -- Telescope command center
  use {
    "FeiyouG/command_center.nvim",
    requires = { "nvim-telescope/telescope.nvim" }
  }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { 'jbyuki/one-small-step-for-vimkind' }
end)


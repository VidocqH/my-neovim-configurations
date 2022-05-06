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
  -- Tab
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  -- Github Copilot
  use { 'github/copilot.vim' }
  -- LSP Server
  use { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' }
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
  use "glepnir/dashboard-nvim"
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
  use "simrat39/symbols-outline.nvim"
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
  use {
    "p00f/nvim-ts-rainbow"
  }
  use { "jiangmiao/auto-pairs" }
  -- Auto Session
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        -- auto_session_enabled = false,
        auto_session_suppress_dirs = { '~/', '~/Projects' }
      }
    end
  }
  -- Fix Buffer Deletion
  use {
    'famiu/bufdelete.nvim'
  }
  use {
    'p00f/clangd_extensions.nvim'
  }
end)


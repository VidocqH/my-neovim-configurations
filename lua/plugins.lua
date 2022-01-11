-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Github Theme
  use {
    "projekt0n/github-nvim-theme",
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
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- Github Copilot
  use { 'github/copilot.vim' }
  -- LSP Server
  use { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
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
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
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
  use "akinsho/toggleterm.nvim"
  -- mini, multiple functionalities
  use { 'echasnovski/mini.nvim', branch = 'stable' }
  -- Notify
  use 'rcarriga/nvim-notify'
  -- Snippet Code Runner
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}
end)


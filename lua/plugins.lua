-- Auto download Packer if there's no
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local PACKER_BOOTSTRAP = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- OneDarkPro Theme
  use "olimorris/onedarkpro.nvim"
  -- Bottom Line
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  -- Devicons
  use "kyazdani42/nvim-web-devicons"
  -- Sidebar File Explorer
  use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }
  -- Highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  -- Sticky Head
  use "nvim-treesitter/nvim-treesitter-context"
  -- Tabs
  use { "romgrk/barbar.nvim", requires="kyazdani42/nvim-web-devicons" }
  -- Github Copilot
  use "github/copilot.vim"
  -- LSP Server
  use "neovim/nvim-lspconfig"
  -- nvim-cmp
  use "hrsh7th/cmp-nvim-lsp" -- { name = nvim_lsp }
  use "hrsh7th/cmp-buffer"   -- { name = "buffer" },
  use "hrsh7th/cmp-path"     -- { name = "path" }
  use "hrsh7th/cmp-cmdline"  -- { name = "cmdline" }
  use "hrsh7th/nvim-cmp"
  -- vsnip
  use "hrsh7th/cmp-vsnip"    -- { name = "vsnip" }
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"
  -- lsp sage
  use { "glepnir/lspsaga.nvim" , branch = "main" }
  -- Telescope
  use { "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }
  -- surround
  use "ur4ltz/surround.nvim"
  -- comment
  use "terrortylor/nvim-comment"
  -- colorizer
  use "norcalli/nvim-colorizer.lua"
  -- Hop - EasyMotion
  use { "phaazon/hop.nvim", branch = "v2" }
  -- Dashboard
  use "glepnir/dashboard-nvim"
  -- Floating Terminal
  use "voldikss/vim-floaterm"
  -- Lines or paragraphs move up and down
  use "fedepujol/move.nvim"
  -- Gitsigns
  use "lewis6991/gitsigns.nvim"
  -- Indent Colorful Lines
  use "lukas-reineke/indent-blankline.nvim"
  -- Which key
  use "folke/which-key.nvim"
  -- Symbols Outline
  use "stevearc/aerial.nvim"
  -- Terminal tab
  use { "akinsho/toggleterm.nvim", tag = "v2.*" }
  -- mini, multiple functionalities
  use { "echasnovski/mini.nvim", branch = "stable" }
  -- Notify
  use "rcarriga/nvim-notify"
  -- Snippet Code Runner
  use { "michaelb/sniprun", run = "bash ./install.sh"}
  -- Rainbow parentheses
  use "p00f/nvim-ts-rainbow"
  -- Auto pairs
  use "windwp/nvim-autopairs"
  -- Auto Session
  use "rmagatti/auto-session"
  -- Clangd Extension
  use "p00f/clangd_extensions.nvim"
  -- Discord Rich Presence
  use "andweeb/presence.nvim"
  -- Lsp progress display
  use "j-hui/fidget.nvim"
  -- Trouble Plane
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  -- Mason
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  -- Debugger
  use "mfussenegger/nvim-dap"
  -- Debugger for Python
  use "mfussenegger/nvim-dap-python"
  -- Debugger UI
  use { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" }
  -- Debugger Virtual text
  use "theHamsta/nvim-dap-virtual-text"
  -- Debugger telescope plugin
  use "nvim-telescope/telescope-dap.nvim"
  -- Telescope command center
  use { "FeiyouG/command_center.nvim", requires = "nvim-telescope/telescope.nvim" }
  -- Linter and formatter
  use "jose-elias-alvarez/null-ls.nvim"
  -- lua debugger for neovim plugin debugging
  use "jbyuki/one-small-step-for-vimkind"
  -- function"s arguments highlight with treesitter
  use { "m-demare/hlargs.nvim", requires = "nvim-treesitter/nvim-treesitter" }
  -- / search lens
  use "kevinhwang91/nvim-hlslens"
  -- Visual Multi -- <VIM plugin>
  use "mg979/vim-visual-multi"
  -- Extension of telescope and auto-session
  use { "rmagatti/session-lens", requires = {"rmagatti/auto-session", "nvim-telescope/telescope.nvim"} }
  -- Lsp Signature
  use "ray-x/lsp_signature.nvim"
  -- Navic
  use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }
  -- Git diffview
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Automatically set up your configuration after cloing packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


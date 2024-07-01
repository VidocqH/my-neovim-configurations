local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- OneDarkPro Theme
  { "olimorris/onedarkpro.nvim", priority = 1000 },
  -- Bottom Line
  { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
  -- Devicons
  "kyazdani42/nvim-web-devicons",
  -- Sidebar File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  -- Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- Sticky Head
  "nvim-treesitter/nvim-treesitter-context",
  -- Commenting with ts
  "JoosepAlviste/nvim-ts-context-commentstring",
  -- Tabs
  { "romgrk/barbar.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
  -- Github Copilot
  -- "zbirenbaum/copilot.lua",
  -- { "zbirenbaum/copilot-cmp", dependencies="zbirenbaum/copilot.lua" },
  { "jcdickinson/codeium.nvim", dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" } },
  -- LSP Server
  "neovim/nvim-lspconfig",
  -- nvim-cmp
  "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
  "hrsh7th/cmp-buffer", -- { name = "buffer" }
  "hrsh7th/cmp-path", -- { name = "path" }
  "hrsh7th/cmp-cmdline", -- { name = "cmdline" }
  "hrsh7th/nvim-cmp",
  -- vsnip
  "hrsh7th/cmp-vsnip", -- { name = "vsnip" }
  "hrsh7th/vim-vsnip",
  "rafamadriz/friendly-snippets",
  -- lsp sage
  { "glepnir/lspsaga.nvim", event = "BufRead" },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
  },
  -- Telescope fzf
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  -- surround
  { "kylechui/nvim-surround", version = "*" },
  -- comment
  "terrortylor/nvim-comment",
  -- colorizer and color picker
  "uga-rosa/ccc.nvim",
  -- Dashboard
  { "glepnir/dashboard-nvim", event = "VimEnter" },
  -- Lines ans blocks move
  "booperlv/nvim-gomove",
  -- Gitsigns
  "lewis6991/gitsigns.nvim",
  -- Indent Colorful Lines
  "lukas-reineke/indent-blankline.nvim",
  -- Indent Current Scope
  { "echasnovski/mini.indentscope", version = "*" },
  -- Which key
  "folke/which-key.nvim",
  -- Symbols Outline
  "stevearc/aerial.nvim",
  -- Terminal tab
  { "akinsho/toggleterm.nvim", version = "*", opts = { direction = "tab" } },
  -- Notify
  "rcarriga/nvim-notify",
  -- Rainbow parentheses
  "HiPhish/rainbow-delimiters.nvim",
  -- Auto pairs
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  -- Auto Session
  "rmagatti/auto-session",
  -- Clangd Extension
  "p00f/clangd_extensions.nvim",
  -- Discord Rich Presence
  "andweeb/presence.nvim",
  -- Lsp progress display
  "j-hui/fidget.nvim",
  -- Trouble Plane
  { "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
  -- Mason
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- Debugger
  "mfussenegger/nvim-dap",
  -- Debugger for Python
  "mfussenegger/nvim-dap-python",
  -- Debugger UI
  { "rcarriga/nvim-dap-ui", dependencies = "mfussenegger/nvim-dap" },
  -- Debugger Virtual text
  "theHamsta/nvim-dap-virtual-text",
  -- Debugger telescope plugin
  "nvim-telescope/telescope-dap.nvim",
  -- Linter and formatter
  "nvimtools/none-ls.nvim",
  -- lua debugger for neovim plugin debugging
  "jbyuki/one-small-step-for-vimkind",
  -- function"s arguments highlight with treesitter
  { "m-demare/hlargs.nvim", dependencies = "nvim-treesitter/nvim-treesitter" },
  -- / search lens
  "kevinhwang91/nvim-hlslens",
  -- Visual Multi -- <VIM plugin>
  "mg979/vim-visual-multi",
  -- Lsp Signature
  "ray-x/lsp_signature.nvim",
  -- Nvim lua dev utils
  "folke/neodev.nvim",
  -- Git diffview
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
  "nvim-neotest/nvim-nio",
  -- Unit test
  "vim-test/vim-test",
  "nvim-neotest/neotest-python",
  "nvim-neotest/neotest-vim-test",
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- cursor word highlight
  "RRethy/vim-illuminate",
  -- Inlay Hint
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
  },

  -- Project specific conf
  "folke/neoconf.nvim",
  -- Import cost of JS/TS
  -- { "barrett-ruth/import-cost.nvim", build = "sh install.sh yarn", config = true },
  -- Markdown Renderer
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  -- Animation
  { "echasnovski/mini.animate", version = "*" },
  -- Fold Extension
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
    event = "BufReadPost",
  },
  -- Scroll Bar
  { "dstein64/nvim-scrollview" },
  -- { "lewis6991/satellite.nvim", opts = {} },
  -- Flash, navigate between words
  { "folke/flash.nvim", event = "VeryLazy" },
  -- todo comments
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  -- Time Record
  { "wakatime/vim-wakatime" },

  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
      { "<leader>ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
      { "<leader>lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
      { "<leader>lt", "<cmd>LBTest<cr>", desc = "Run Code" },
      { "<leader>ls", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
    },
  },

  -- npm package info
  { "vuki656/package-info.nvim", dependencies = "MunifTanjim/nui.nvim" },

  -- { 'altermo/ultimate-autopair.nvim', event={'InsertEnter','CmdlineEnter'}, branch='v0.6', opts={} },

  {
    "VidocqH/data-viewer.nvim",
    dev = true,
    opts = { autoDisplayWhenOpenFile = true, view = { float = false } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kkharji/sqlite.lua",
    },
  },
  {
    "VidocqH/lsp-lens.nvim",
    dev = true,
    -- opts = {},
  },
  {
    "VidocqH/auto-indent.nvim",
    dev = true,
    opts = {
      indentexpr = function(lnum)
        return require("nvim-treesitter.indent").get_indent(lnum)
      end,
    },
  },
}, {
  dev = {
    path = "~/nvim_plugs",
    pattern = { "data-viewer", "lsp-lens", "auto-indent" },
  },
})

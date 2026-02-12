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
  -- TS text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        },
      })
    end,
  },
  -- Commenting with ts
  "JoosepAlviste/nvim-ts-context-commentstring",
  -- Tabs
  { "romgrk/barbar.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
  -- Github Copilot
  -- "zbirenbaum/copilot.lua",
  -- { "zbirenbaum/copilot-cmp", dependencies="zbirenbaum/copilot.lua" },
  -- { "jcdickinson/codeium.nvim", dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" } },
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<C-j>", neocodeium.accept)
    end,
  },
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
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python",
    lazy = false,
    opts = {},
  },
  -- surround
  { "kylechui/nvim-surround", version = "*" },
  -- comment
  "terrortylor/nvim-comment",
  -- colorizer and color picker
  "uga-rosa/ccc.nvim",
  { "brenoprata10/nvim-highlight-colors", opts = {} },
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
  "hedyhli/outline.nvim",
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
  -- "andweeb/presence.nvim",
  { "vyfor/cord.nvim", build = "./build || .\\build", event = "VeryLazy" },
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
  -- Linter and formatter integration with Mason
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = { handlers = {} },
  },
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
  -- Animation
  { "echasnovski/mini.animate", version = "*" },
  { "luukvbaal/statuscol.nvim", event = "FileType" },
  -- Fold Extension
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
    event = "BufReadPost",
  },
  -- Lazygit
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
  },
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

  -- {
  --   -- "supermaven-inc/supermaven-nvim",
  --   "noisethanks/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({ color = { suggestion_color = "#00ff00" } })
  --   end,
  -- },

  -- npm package info
  { "vuki656/package-info.nvim", dependencies = "MunifTanjim/nui.nvim" },

  -- { 'altermo/ultimate-autopair.nvim', event={'InsertEnter','CmdlineEnter'}, branch='v0.6', opts={} },

  -- render markdown live inline
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  { "nvim-pack/nvim-spectre", opts = { mapping = {} } },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- set this if you want to always pull the latest change
  --   build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  --     or "make",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-mini/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "stevearc/dressing.nvim", -- for input provider dressing
  --     "folke/snacks.nvim", -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    lazy = false,
    init = function()
      require("plugin-config/neominimap-config")
    end,
  },
  {
    "ray-d-song/inlay-hint-trim.nvim",
    config = function()
      require("inlay-hint-trim").setup()
    end,
  },
  -- {
  --   "ravitemer/mcphub.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  --   config = function()
  --     require("mcphub").setup()
  --   end,
  -- },

  {
    "2kabhishek/markit.nvim",
    dependencies = { "2kabhishek/pickme.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    event = "VeryLazy",
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
    opts = {
      terminal = { provider = "none" },
    },
  },

  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },

  -- {
  --   "monkoose/neocodeium",
  --   event = "VeryLazy",
  --   config = function()
  --     local neocodeium = require("neocodeium")
  --     neocodeium.setup()
  --     vim.keymap.set("i", "<C-j>", neocodeium.accept)
  --   end,
  -- },
  -- wait for feature complete
  -- {
  --   "nabekou29/js-i18n.nvim",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-lua/plenary.nvim",
  --   },
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {},
  -- },

  {
    "VidocqH/data-viewer.nvim",
    dev = true,
    opts = { autoDisplayWhenOpenFile = true, view = { float = false } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kkharji/sqlite.lua",
    },
  },
  -- {
  --   "VidocqH/lsp-lens.nvim",
  --   dev = true,
  --   -- opts = {},
  -- },
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

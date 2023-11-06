require("nvim-treesitter.configs").setup({
  ensure_installed = { "vim", "lua", "javascript", "json", "typescript", "python", "cpp", "c" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Highlight Module
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Incremental Module
  incremental_selection = {
    enable = true,
    keymaps = {},
    -- keymaps = {
    -- init_selection = '<CR>',
    -- node_incremental = '<CR>',
    -- node_decremental = '<BS>',
    -- scope_incremental = '<TAB>',
    -- }
  },

  -- Code Formatted Module
  indent = {
    enable = true,
  },

  -- Rainbow parentheses
  rainbow = {
    enable = true,
  },

  -- Context Comment
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

-- Foldding Module
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- Treesitter context config
require("treesitter-context").setup({
  zindex = 2000, -- The Z-index of the context window
  mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
  multiline_threshold = 10,
})

require("rainbow-delimiters.setup")({
  query = {
    [""] = "rainbow-delimiters",
    latex = "rainbow-blocks",
    html = "rainbow-delimiters",
    jsx = "rainbow-delimiters-react",
    tsx = "rainbow-delimiters-react",
    vue = "rainbow-delimiters",
  },
  highlight = {
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
    "RainbowDelimiterRed",
  },
  -- blacklist = {'c', 'cpp'},
})

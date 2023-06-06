require'nvim-treesitter.configs'.setup {
  ensure_installed = {"vim", "lua", "javascript", "json", "typescript", "python", "cpp", "c"},

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
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },

  -- Code Formatted Module
  indent = {
    enable = true
  },

  -- Rainbow parentheses
  rainbow = {
    enable = true,
    hlgroups = {
      'TSRainbowYellow',
      'TSRainbowBlue',
      'TSRainbowOrange',
      'TSRainbowGreen',
      'TSRainbowViolet',
      'TSRainbowCyan',
      'TSRainbowRed'
    },
    query = {
      html = 'rainbow-tags',
      latex = 'rainbow-blocks',
      javascript = 'rainbow-parens-react',
      tsx = 'rainbow-parens-react',
      vue = 'rainbow-parens',
    }
  },

  -- Context Comment
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

-- Foldding Module
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Treesitter context config
require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      'class',
      'function',
      'method',
      'for', -- These won't appear in the context
      'while',
      'if',
      'switch',
      'case',
    },
  },
  zindex = 2000, -- The Z-index of the context window
  mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
}


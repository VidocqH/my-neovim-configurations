require'nvim-treesitter.configs'.setup {
  ensure_installed = {"vim", "lua", "javascript", "json", "typescript", "python", "cpp"},

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
}

-- Foldding Module
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- Set dont fold as default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99

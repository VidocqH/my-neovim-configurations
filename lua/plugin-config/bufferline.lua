vim.g.barbar_auto_setup = false

-- Set barbar's options
require'bufferline'.setup {
  exclude_ft = {'dap-repl'},

  -- Configure icons on the bufferline.
  icons = {
    inactive = { separator = { left = '' } }
  },

  -- Sets the maximum padding width with which to surround each tab
  -- maximum_padding = 0.5,

  sidebar_filetypes = {
    ['neo-tree'] = {event = 'BufWipeout', text = "Explorer"},
    -- Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },
}


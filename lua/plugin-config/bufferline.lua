-- Set barbar's options
require'bufferline'.setup {
  -- Excludes buffers from the tabline
  exclude_ft = {'dap-repl'},
  -- exclude_name = {'package.json'},

  -- Configure icons on the bufferline.
  icons = {
    separator = {left = '▎', right = ''},
    inactive = {
      separator = {left = ''}
    }
  },

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 0.5,

  sidebar_filetypes = {
    ['neo-tree'] = {event = 'BufWipeout', text = 'Explorer'},
    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },
}


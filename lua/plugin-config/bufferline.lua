-- Set barbar's options
require'bufferline'.setup {
  -- Excludes buffers from the tabline
  exclude_ft = {'dap-repl'},
  exclude_name = {'package.json'},

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = true,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '',

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 0.5,
}

-- -- Deal with nvim-tree
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size(), string.rep(" ", (get_tree_size() - 13) / 2) .. "File Explorer", "")
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size(), string.rep(" ", (get_tree_size() - 13) / 2) .. "File Explorer", "")
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

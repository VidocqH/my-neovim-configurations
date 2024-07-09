require('telescope').load_extension('fzf')
require("telescope").load_extension("notify")
require('telescope').load_extension('dap')
require("telescope").load_extension("live_grep_args")

local trouble = require("trouble.sources.telescope")
local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  extensions = {
    aerial = { show_nesting = true },
    live_grep_args = {
      -- override default mappings
      default_mappings = {},
    },
    fzf = {},
  }
}

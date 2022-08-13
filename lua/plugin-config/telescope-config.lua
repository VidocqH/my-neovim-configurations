 -- temporary fix file folding
local telescope_actions = require("telescope.actions.set")
local fixfolds = {
	hidden = true,
	attach_mappings = function(_)
		telescope_actions.select:enhance({
			post = function()
				vim.cmd(":normal! zx")
			end,
		})
		return true
	end,
}

require("telescope").load_extension("notify")
require("telescope").load_extension('aerial')
require('telescope').load_extension('dap')

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
   pickers = {
     buffers = fixfolds,
     find_files = fixfolds,
     git_files = fixfolds,
     grep_string = fixfolds,
     live_grep = fixfolds,
     oldfiles = fixfolds,
   },
}

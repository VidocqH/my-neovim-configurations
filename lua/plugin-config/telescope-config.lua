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
 require("telescope").load_extension("command_center")

 local trouble = require("trouble.providers.telescope")
 local telescope = require("telescope")
 local command_center = require("command_center")

 local noremap = {noremap = true}
 local silent_noremap = {noremap = true, silent = true}
 command_center.add({
   {
     desc = "Search inside current buffer",
     cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
     keys = { "n", "<leader>fl", noremap },
   }, {
     -- If no descirption is specified, cmd is used to replace descirption by default
     -- You can change this behavior in setup()
     cmd = "<CMD>Telescope find_files<CR>",
     keys = { "n", "<leader>ff", noremap },
   }, {
     -- If no keys are specified, no keymaps will be displayed nor set
     desc = "Find hidden files",
     cmd = "<CMD>Telescope find_files hidden=true<CR>",
   }, {
     -- You can specify multiple keys for the same cmd ...
     desc = "Show document symbols",
     cmd = "<CMD>Telescope lsp_document_symbols<CR>",
     keys = {
       {"n", "<leader>ss", noremap},
       {"n", "<leader>ssd", noremap},
     },
   }, {
     -- ... and for different modes
     desc = "Show function signaure (hover)",
     cmd = "<CMD>lua vim.lsp.buf.hover()<CR>",
     keys = {
       {"n", "K", silent_noremap },
       {"i", "<C-k>", silent_noremap },
     }
   }, {
     -- You can pass in a key sequences as if you would type them in nvim
     desc = "My favorite key sequence",
     cmd = "A  -- Add a comment at the end of a line",
     keys = {"n", "<leader>Ac", noremap}
   }, {
     -- You can also pass in a lua functions as cmd
     -- NOTE: binding lua funciton to a keymap requires nvim 0.7 and above
     desc = "Run lua function",
     cmd = function() print("ANONYMOUS LUA FUNCTION") end,
     keys = {"n", "<leader>alf", noremap},
   -- }, {
   --   -- If no cmd is specified, then this entry will be ignored
   --   desc = "lsp run linter",
   --   keys = {"n", "<leader>sf", noremap},
   }, {
     desc = "dlp commands",
     cmd = "<CMD>Telescope dap commands<CR>",
   }, {
     desc = "dlp configurations",
     cmd = "<CMD>Telescope dap configurations<CR>",
   }, {
     desc = "dlp list_breakpoints",
     cmd = "<CMD>Telescope dap list_breakpoints<CR>"
   }, {
     desc = "dlp variables",
     cmd = "<CMD>Telescope dap variables<CR>"
   }, {
     desc = "dlp frames",
     cmd = "<CMD>Telescope dap frames<CR>"
   }
})

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
   extensions = {
    command_center = {
      components = {
        command_center.component.DESC,
        command_center.component.KYES,
      },
      sort_by = {
        command_center.component.DESC,
        command_center.component.KEYS,
      },
      auto_replace_desc_with_cmd = false,
    }
  }
}

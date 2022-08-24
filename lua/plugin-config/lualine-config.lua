local gps = require("nvim-gps")
require('lualine').setup {
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {'encoding', 'filetype', 'progress'},
    lualine_y = {},
  },
  options = {
    -- theme = 'github'
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      dapui_watches = {},
      dapui_stacks = {},
      dapui_breakpoints = {},
      dapui_scopes = {},
      dapui_console = {},
      dap_repl = {}
    },
  },
  extensions = { 'nvim-tree' , 'toggleterm', 'aerial', 'nvim-dap-ui' },
}

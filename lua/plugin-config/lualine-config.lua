require('lualine').setup {
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_c = {
      { 'filename', file_status = false, path = 1, color = { fg = '#7f848e' } },
    },
    lualine_x = {'encoding', 'filetype', 'progress'},
    lualine_y = {},
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  options = {
    theme = 'auto',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      lspsagaoutline = {},
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
  extensions = { 'toggleterm', 'aerial', 'nvim-dap-ui', 'neo-tree' },
}

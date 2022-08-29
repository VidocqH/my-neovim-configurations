require"surround".setup { mappings_style = "surround" }
-- you can configure Hop the way you like here; see :h hop-config
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
require"which-key".setup {}
require"fidget".setup {}
require"trouble".setup {}
require"mason".setup()
require'dap-python'.setup()
require'dapui'.setup()
require'nvim-dap-virtual-text'.setup{}
--   require('hlargs').setup()
require'session-lens'.setup({})

vim.cmd("let g:VM_theme='codedark'")


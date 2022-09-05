require"surround".setup { mappings_style = "surround" }
-- you can configure Hop the way you like here; see :h hop-config
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
require'nvim_comment'.setup()
require'colorizer'.setup ()
require'mini.cursorword'.setup {}
require'nvim-autopairs'.setup {}
require"which-key".setup {}
require"fidget".setup {}
require"trouble".setup {}
require"mason".setup { log_level = vim.log.levels.DEBUG }
require'dap-python'.setup()
require'dapui'.setup()
require'nvim-dap-virtual-text'.setup{}
-- require('hlargs').setup()  -- Performance severe
require'session-lens'.setup({})
require'lsp_signature'.setup()

vim.cmd("let g:VM_theme='codedark'")


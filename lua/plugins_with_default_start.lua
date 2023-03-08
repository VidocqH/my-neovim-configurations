IS_VSCODE = vim.fn.exists('g:vscode') == 1 and true or false

if IS_VSCODE == false then
  -- you can configure Hop the way you like here; see :h hop-config
  require"nvim-surround".setup {}
  require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  require'lsp_signature'.setup()
  require'colorizer'.setup ()
  require"fidget".setup {}
  require'session-lens'.setup({})
  require"trouble".setup {}
  require"mason".setup { log_level = vim.log.levels.DEBUG }
  require'dap-python'.setup()
  require'dapui'.setup()
  require'nvim-dap-virtual-text'.setup{}
  -- Use vscode move
  require'gomove'.setup({ map_defaults = false })
  require"which-key".setup {}
  require'lsp_lens'.setup({})
  require'nvim-autopairs'.setup({ check_ts = true })
  require('hlargs').setup()  -- Performance severe
  require('hlslens').setup()

  vim.cmd("let g:VM_theme='codedark'")
end
require'nvim_comment'.setup()


vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup {
  log_level = 'info',
  -- auto_session_enabled = false,
  auto_session_suppress_dirs = { '~/', '~/Projects' },
  bypass_session_save_file_types = { 'aerial', 'dap-repl', '' },
}

require'sniprun'.setup({
  -- repl_enable = { "python3" },               --# enable REPL-like behavior for the given interpreters
  --# you can combo different display modes as desired
  --
  display = {
    "NvimNotify",              --# display with the nvim-notify plugin
  },

  display_options = {
    notification_timeout = 15   --# timeout for nvim_notify output
  },
})

-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
-- vim.o.sessionoptions="aerial"

-- Set current line highlight
vim.cmd[[highlight AerialLine guifg=yellow]]

require('aerial').setup({
  highlight_mode = "full_width",
  highlight_on_hover = true,
  show_guides = true,
  manage_folds = false,
  close_automatic_events = { "switch_buffer" },
  link_folds_to_tree = false,
})

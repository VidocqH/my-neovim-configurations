require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  start_in_insert = true,
  direction = 'tab',
  close_on_exit = true, -- close the terminal window when the process exits
}

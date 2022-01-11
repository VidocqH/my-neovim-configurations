local set = vim.opt
set.list = true

require("indent_blankline").setup {
  -- space_char_blankline = " ",
  -- show_current_context = true,
  -- show_current_context_start = true,
  buftype_exclude = { "terminal" },
  filetype_exclude = { "dashboard" },
  show_end_of_line = true,
}

vim.opt.list = true

-- vim.cmd [[highlight IndentBlankLineContextChar guifg=#e5c07b]]

require("indent_blankline").setup {
  use_treesitter = true,
  space_char_blankline = " ",
  show_current_context = false,
  show_current_context_start = false,
  buftype_exclude = { "terminal" },
  filetype_exclude = { "dashboard", "mason", "NvimTree", "lazy" },
}

require('mini.indentscope').setup({
    symbol = '│',
})


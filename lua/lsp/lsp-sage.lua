local lspsaga = require 'lspsaga'
lspsaga.setup({
  -- border_style = "rounded", -- "single" | "double" | "rounded" | "bold" | "plus"
  preview = {
    lines_above = 10,
    lines_below = 20,
  },
  scroll_preview = {
    scroll_down = '<C-f>',
    scroll_up = '<C-p>',
  },
  request_timeout = 15000,
  lightbulb = { enable = false },
  code_action = {
    keys = {
      quit = "<Esc>",
      exec = "<CR>",
    }
  },
  -- show outline
  outline = {
    keys = {
      jump = '<CR>',
    }
  },
  symbol_in_winbar = {
    enable = false,
  },
})

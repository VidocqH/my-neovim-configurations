local lspsaga = require 'lspsaga'
lspsaga.setup({
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
  outline = {
    keys = {
      jump = '<CR>',
    }
  },
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    border = 'rounded',
    colors = {
      --float window normal background color
      normal_bg = '#000000',
    }
  }
})

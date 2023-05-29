local animate = require('mini.animate')

require('mini.animate').setup({
  cursor = {
    enable = false,
    timing = animate.gen_timing.linear({duration = 100, unit= 'total'})
  },
  scroll = {
    enable = false,
    timing = animate.gen_timing.linear({duration = 100, unit= 'total'})
  }
})

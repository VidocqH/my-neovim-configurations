local gps = require("nvim-gps")
require('lualine').setup {
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    }
  },
  options = {
    theme = 'github'
  },
  extensions = { 'nvim-tree' , 'toggleterm', 'symbols-outline'}
}

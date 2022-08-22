local db = require('dashboard')
vim.cmd("highlight DashboardHeader guifg=#77ff77")

db.custom_header = {
  "",
  "/\\   /(_) __| | ___   ___ __ _ ",
  "\\ \\ / / |/ _` |/ _ \\ / __/ _` |",
  " \\ V /| | (_| | (_) | (_| (_| |",
  "  \\_/ |_|\\__,_|\\___/ \\___\\__, |",
  "                            |_|",
  ""
}
db.custom_center = {
  {
    icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'DashboardFindHistory',
    shortcut = 'SPC f h'
  },
  {
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'
  },
  {icon = '  ',
    desc ='File Browser                            ',
    action =  'Telescope file_browser',
    shortcut = 'SPC f b'
  },
  {
    icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w'
  },
  {
    icon = '  ',
    desc = 'Open Command Center                     ',
    action = 'Telescope command_center',
    shortcut = 'SPC f c'
  },
}


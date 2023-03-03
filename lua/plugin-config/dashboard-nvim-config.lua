local db = require('dashboard').setup {
  theme = "hyper",
  config = {
    header = {
      "",
      "/\\   /(_) __| | ___   ___ __ _ ",
      "\\ \\ / / |/ _` |/ _ \\ / __/ _` |",
      " \\ V /| | (_| | (_) | (_| (_| |",
      "  \\_/ |_|\\__,_|\\___/ \\___\\__, |",
      "                            |_|",
      ""
    },
    week_header = {
      enable = true
    },
    shortcut = {
      { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Apps',
        group = 'DiagnosticHint',
        action = 'Telescope app',
        key = 'a',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope find_files hidden=true',
        key = 'd',
      },
    },
    footer = {"Carpe Diem"},
  }
}
vim.cmd("highlight DashboardHeader guifg=#E5C07B")


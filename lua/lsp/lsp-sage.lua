local lspsaga = require 'lspsaga'
lspsaga.init_lsp_saga({
  border_style = "rounded", -- "single" | "double" | "rounded" | "bold" | "plus"
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-p>', next = '<C-n>' },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 30,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = { enable = false },
  -- finder do lsp request timeout
  -- if your project big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 150000,
  finder_action_keys = {
    open = "<CR>",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "<Esc>",
  },
  code_action_keys = {
    quit = "<Esc>",
    exec = "<CR>",
  },
  definition_action_keys = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = '<Esc>',
  },
  rename_action_quit = "<Esc>",
  -- show outline
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = '<CR>',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
})

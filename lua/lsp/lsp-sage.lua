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
  finder_request_timeout = 15000,
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
    jump_key = '<CR>',
    auto_refresh = true,
  },
  -- show symbols in winbar must nightly
  -- in_custom mean use lspsaga api to get symbols
  -- and set it to your custom winbar or some winbar plugins.
  -- if in_cusomt = true you must set in_enable to false
  symbol_in_winbar = {
    in_custom = false,
    enable = false,
    separator = ' ',
    show_file = true,
    -- define how to customize filename, eg: %:., %
    -- if not set, use default value `%:t`
    -- more information see `vim.fn.expand` or `expand`
    -- ## only valid after set `show_file = true`
    file_formatter = "",
    click_support = function(node, clicks, button, modifiers)
      -- To see all avaiable details: vim.pretty_print(node)
      local st = node.range.start
      local en = node.range['end']
      if button == "l" then
        if clicks == 2 then
          -- double left click to do nothing
        else -- jump to node's starting line+char
          vim.fn.cursor(st.line + 1, st.character + 1)
        end
      elseif button == "r" then
        if modifiers == "s" then
          print "lspsaga" -- shift right click to print "lspsaga"
        end -- jump to node's ending line+char
        vim.fn.cursor(en.line + 1, en.character + 1)
      elseif button == "m" then
        -- middle click to visual select node
        vim.fn.cursor(st.line + 1, st.character + 1)
        vim.cmd "normal v"
        vim.fn.cursor(en.line + 1, en.character + 1)
      end
    end,
  },
})

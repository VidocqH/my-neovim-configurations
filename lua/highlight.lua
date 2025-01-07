-- Global
vim.cmd("highlight MiniIndentscopeSymbol guifg=#e5c07b")

if vim.o.background == "dark" then
  vim.cmd("highlight IlluminatedWordText gui=None guibg=#333333")
  vim.cmd("highlight IlluminatedWordRead gui=None guibg=#333333")
  vim.cmd("highlight IlluminatedWordWrite gui=None guibg=#333333")

  vim.cmd("highlight BufferInactive guibg=#0e0e0e guifg=#7f848e")
  vim.cmd("highlight BufferInactiveMod guibg=#0e0e0e guifg=#7f848e")
  vim.cmd("highlight BufferInactiveSign guibg=#0e0e0e guifg=#7f848e")
  vim.cmd("highlight BufferInactiveIndex guibg=#0e0e0e guifg=#7f848e")
  vim.cmd("highlight BufferInactiveTarget guibg=#0e0e0e guifg=#7f848e gui=bold")
  vim.cmd("highlight BufferTabpages guibg=#0e0e0e guifg=#7f848e gui=bold")
  vim.cmd("highlight BufferTabpagesFill guibg=#0e0e0e guifg=#7f848e")

  vim.cmd("highlight TreesitterContext guibg=#101010")
  vim.cmd("highlight TreesitterContextLineNumber guibg=#101010 guifg=#434852")

  vim.cmd("highlight StatusColumnNC guibg=#000")
  vim.cmd("highlight SignColumnNC guibg=#000")
  vim.cmd("highlight LineNrNC guibg=#000")

  vim.cmd("highlight StatusLine guibg = #0d0d0d")
  vim.cmd("highlight GitSignsCurrentLineBlame guifg=#212630 guibg=CursorLine")

  -- vim.cmd("highlight LineNrAbove guifg=#495162 guibg=#000000")
  -- vim.cmd("highlight LineNrBelow guifg=#495162 guibg=#000000")
  -- vim.cmd("highlight SignColumnNC guifg=#434852 guibg=#000000")
  vim.cmd("highlight CursorLineSign guibg=#171717")
  vim.cmd("highlight CursorLineFold guibg=#171717")

  vim.cmd("highlight SpellBad guifg=NONE guisp=#e5c07b")
  vim.cmd("highlight SpellCap guifg=NONE guisp=#e5c07b")
  vim.cmd("highlight SpellRare guifg=NONE guisp=#e5c07b")
  vim.cmd("highlight SpellLocal guifg=NONE guisp=#e5c07b")
else
  vim.cmd("highlight IlluminatedWordText gui=None guibg=#dddddd")
  vim.cmd("highlight IlluminatedWordRead gui=None guibg=#dddddd")
  vim.cmd("highlight IlluminatedWordWrite gui=None guibg=#dddddd")
  vim.cmd("highlight TreesitterContext guibg = #cccccc")
  vim.cmd("highlight TreesitterContextLineNumber guibg=#cccccc guifg=#aaaaaa")
  vim.cmd("highlight GitSignsCurrentLineBlame guifg=Comment guibg=CursorLine")
end

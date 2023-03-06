
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


-- vim.cmd("highlight StatusLine              guibg = #0d0d0d")

-- TreesitterContext
-- if vim.o.background == "dark" then
--   highlight("TreesitterContext", {guibg = "#101010"})
--   highlight("TreesitterContextLineNumber", {guibg=#101010, guifg=#434852})
-- else
--   highlight("TreesitterContext", {guibg = #cccccc})
--   highlight("TreesitterContextLineNumber", {guibg=#cccccc, guifg=#aaaaaa})
-- end
--

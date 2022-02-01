vim.g.mapleader = ' '

local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.smartindent = true

set.cursorline = true
set.cursorcolumn = true

set.number = true
set.relativenumber = true

set.termguicolors = true

set.mouse = 'a'

set.hidden = true

if (vim.fn.has('win32'))
then
  set.shell = 'powershell'
  set.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  set.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set.shellquote = ''
  set.shellxquote = ''
end

vim.g.mapleader = ' '

local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.cursorline = true
-- set.cursorcolumn = true

-- Set dont fold as default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
set.foldlevelstart = 99

set.number = true
set.relativenumber = true

set.termguicolors = true

set.mouse = 'a'

set.hidden = true

set.conceallevel = 3

-- Windows Shell Setting
if (vim.fn.has('win32') == 1)
then
  set.shell = 'powershell'
  set.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  set.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set.shellquote = ''
  set.shellxquote = ''
end

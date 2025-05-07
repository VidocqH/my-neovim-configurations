vim.loader.enable()
vim.g.mapleader = " "

local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 0
set.expandtab = true

set.cursorline = true
-- if IS_VSCODE == false then
--   set.cursorcolumn = true
-- end

set.wrap = false

set.foldcolumn = "1" -- '0' is not bad
set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
set.foldlevelstart = 99
set.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

set.number = true
set.relativenumber = true

set.termguicolors = true

set.mouse = "a"

set.hidden = true

set.conceallevel = 3

vim.opt_local.spell = true
vim.opt_local.spelllang = "en"

-- After upgrades in early 2024, neovim disables react native's hot reload, disable swapping files to fix it
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- Support for non-builtin filetypes
vim.filetype.add({ extension = { mdx = "mdx" } })

vim.o.winborder = "rounded"
if IS_NEOVIDE then
  set.winblend = 50
  set.pumblend = 50
end

-- Windows Shell Setting
if IS_WINDOWS then
  set.shell = "powershell"
  set.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  set.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  set.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  set.shellquote = ""
  set.shellxquote = ""
end

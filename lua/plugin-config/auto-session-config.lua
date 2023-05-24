-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winpos,terminal"
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

local ignore_file_type = {
  "aerial",
  "dap-repl",
  ""
}

local function has_val(arr, val1)
  for _, val in pairs(arr) do
    if string.match(val, val1) then
      return true
    end
  end
  return false
end

require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
  -- auto_restore_enabled = false,
  pre_cwd_changed_hook = function()
    vim.api.nvim_exec_autocmds('User', {pattern = 'SessionSavePre'})
  end,
  post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
    require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
  end,
}


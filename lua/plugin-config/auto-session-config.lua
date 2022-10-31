vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winpos,terminal"

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

local function close_buffers()
  local windows = vim.api.nvim_list_wins()
  for idx, val in ipairs(windows) do
    local buf = vim.api.nvim_win_get_buf(idx)
    local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if has_val(ignore_file_type, buf_ft) then
      vim.api.nvim_win_close(val)
    end
  end
end

require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
  pre_save_cmds = { close_buffers },
  -- auto_restore_enabled = false,
}


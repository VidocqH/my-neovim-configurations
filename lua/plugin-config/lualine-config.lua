local Job = require("plenary.job")
local async = require("plenary.async")

local get_wakatime_time = function()
  local tx, rx = async.control.channel.oneshot()
  local ok, job = pcall(Job.new, Job, {
    -- command = os.getenv("HOME") .. "/.wakatime/wakatime-cli",
    command = "wakatime-cli",
    args = { "--today" },
    on_exit = function(j, _)
      tx(j:result()[1] or "")
    end,
  })
  if not ok then
    vim.notify("Bad WakaTime call: " .. job, "warn")
    return ""
  end

  job:start()
  return rx()
end

local WAKATIME_UPDATE_INTERVAL = 10000
local comp_wakatime_time = ""

-- Yield statusline value
local wakatime = function()
  if not Wakatime_routine_init then
    local timer = vim.uv.new_timer()
    if timer == nil then
      return ""
    end
    -- Update wakatime every 10s
    vim.uv.timer_start(timer, 500, WAKATIME_UPDATE_INTERVAL, function()
      async.run(get_wakatime_time, function(time)
        comp_wakatime_time = time
      end)
    end)

    Wakatime_routine_init = true
  end

  return comp_wakatime_time
end

require("lualine").setup({
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_c = {
      { "filename", file_status = false, path = 1, color = { fg = "#7f848e" } },
    },
    lualine_x = {
      "encoding",
      "filetype",
      "progress",
      { wakatime, icon = "󱑆", color = { fg = "#73ddec" } },
    },
    lualine_y = { { "datetime", style = "%I:%M:%S %p" } },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
  options = {
    theme = "auto",
    component_separators = "|",
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      lspsagaoutline = {},
      statusline = {},
      winbar = {},
      dapui_watches = {},
      dapui_stacks = {},
      dapui_breakpoints = {},
      dapui_scopes = {},
      dapui_console = {},
      dap_repl = {},
    },
  },
  extensions = { "toggleterm", "aerial", "nvim-dap-ui", "neo-tree" },
})

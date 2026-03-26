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
        if time == nil or time == "" then
          return
        end
        comp_wakatime_time = time:gsub(" hrs", "h"):gsub(" mins", "m"):gsub(" secs", "s")
      end)
    end)

    Wakatime_routine_init = true
  end

  return comp_wakatime_time
end

-- local robot_emotions = { "󰚩", "󱚝", "󱚟", "󱚡", "󱚣", "󱜙", "󱚥" }
local robot_emotions = { "󱙺", "󱚞", "󱚠", "󱚢", "󱚤", "󱜚", "󱚦" }
local claudecode = require("claudecode")
local function claudecode_status()
  if claudecode:is_claude_connected() then
    return "✳ Claude Code " .. robot_emotions[math.random(#robot_emotions)]
  else
    return "✳ Claude Code 󱙻"
  end
end
local function claudecode_status_color()
  if claudecode:is_claude_connected() then
    return { fg = "#D77757" }
  else
    return { fg = "#ff5555" }
  end
end

local auto_theme_custom = require('lualine.themes.auto')
auto_theme_custom.normal.c.bg = 'none'

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
      -- { mcp_hub_status, color = mcp_hub_color },
      "progress",
      { claudecode_status, color = claudecode_status_color },
      { wakatime, icon = "󱑆", color = { fg = "#73ddec" } },
    },
    lualine_y = { { "datetime", style = "%I:%M:%S %p" } },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
  options = {
    -- theme = "auto",
    theme = auto_theme_custom,
    globalstatus = true,
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

local CONSTANTS = require("../constant_template")
if pcall(require, "../constant") then
  CONSTANTS = require("../constant")
end

--- @deprecated presence.nvim configs
-- local CREDENTIAL_INFO = {
--   workspace_text = "Working on SCP-███",
--   -- editing_text = "Editing 🅳🅴🅻🅴🆃🅴🅳"
--   editing_text = "Editing 🅲🅾🅽🅵🅸🅳🅴🅽🆃🅸🅰🅻",
--   buttons = false,
-- }
--
-- local NORMAL_INFO = {
--   workspace_text = "Working on %s",
--   editing_text = "Editing %s",
--   buttons = true,
-- }
--
-- The setup config table shows all available config options with their default values:
-- require("presence"):setup({
--   -- General options
--   neovim_image_text = '"Vim, or Neovim, that is the question." By William Shakespeare', -- Text displayed when hovered over the Neovim image
--   main_image = "file", -- Main image display (either "neovim" or "file")
--   enable_line_number = false, -- Displays the current line number instead of the current project
--   blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
--
--   buttons = displayText.buttons, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
--   workspace_text = displayText.workspace_text,
--   editing_text = displayText.editing_text,
-- })

local CREDENTIAL_INFO = {
  viewing = "Viewing 🅲🅾🅽🅵🅸🅳🅴🅽🆃🅸🅰🅻", -- Text to display when viewing a readonly file
  editing = "Editing 🅲🅾🅽🅵🅸🅳🅴🅽🆃🅸🅰🅻", -- Text to display when editing a file
  file_browser = "Browsing files in {}", -- Text to display when browsing files (Empty string to disable)
  plugin_manager = "Managing plugins in {}", -- Text to display when managing plugins (Empty string to disable)
  lsp_manager = "Configuring LSP in {}", -- Text to display when managing LSP servers (Empty string to disable)
  vcs = "Committing changes in {}", -- Text to display when using Git or Git-related plugin (Empty string to disable)
  workspace = "Working on SCP-███", -- Text to display when in a workspace (Empty string to disable)
}

local NORMAL_INFO = {
  viewing = "Viewing {}", -- Text to display when viewing a readonly file
  editing = "Editing {}", -- Text to display when editing a file
  file_browser = "Browsing files in {}", -- Text to display when browsing files (Empty string to disable)
  plugin_manager = "Managing plugins in {}", -- Text to display when managing plugins (Empty string to disable)
  lsp_manager = "Configuring LSP in {}", -- Text to display when managing LSP servers (Empty string to disable)
  vcs = "Committing changes in {}", -- Text to display when using Git or Git-related plugin (Empty string to disable)
  workspace = "Working on {}", -- Text to display when in a workspace (Empty string to disable)
}

local MY_PROFILE_BUTTON = { label = "My Github Profile", url = "https://github.com/VidocqH" }
local CREDENTIAL_BUTTONS = { { label = "SCP Foundation", url = "https://scp-wiki.wikidot.com" }, MY_PROFILE_BUTTON }
local NORMAL_BUTTONS = { { label = "View Repository", url = "git" }, MY_PROFILE_BUTTON }

local function getDisplaySettings()
  local project_path = vim.fn.getcwd()
  for i = 1, #CONSTANTS.DISCORD_IGNORE do
    if string.find(project_path, CONSTANTS.DISCORD_IGNORE[i]) then
      return { text = CREDENTIAL_INFO, buttons = CREDENTIAL_BUTTONS }
    end
  end
  return { text = NORMAL_INFO, buttons = NORMAL_BUTTONS }
end

local displaySettings = getDisplaySettings()
require("cord").setup({
  editor = {
    tooltip = '"Vim, or Neovim, that is the question." By William Shakespeare', -- Text to display when hovering over the editor's image
  },
  idle = {
    timeout = 3000000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
    disable_on_focus = true, -- Do not display idle status when neovim is focused
  },
  text = displaySettings.text,
  buttons = displaySettings.buttons,
  assets = {
    Outline = {
      name = "Outline",
      tooltip = "Outline.nvim",
      type = "file_browser",
      icon = "https://github.com/vyfor/cord.nvim/blob/master/assets/file_browser/default.png?raw=true",
    },
    sagafinder = {
      name = "LspSagaFinder",
      tooltip = "lspsaga.nvim",
      type = "file_browser",
      icon = "https://nvimdev.github.io/lspsaga/logo.png",
    },
    DiffviewFileHistory = {
      name = "DiffviewFileHistory",
      tooltip = "diffview.nvim",
      type = "vcs",
      icon = "https://github.com/vyfor/cord.nvim/blob/master/assets/vcs/default.png?raw=true",
    },
    Avante = {
      name = "Avante",
      tooltip = "avante.nvim",
      type = "language",
      icon = "https://github.com/user-attachments/assets/2e2f2a58-2b28-4d11-afd1-87b65612b2de",
    },
    AvanteInput = {
      name = "Avante",
      tooltip = "avante.nvim",
      type = "language",
      icon = "https://github.com/user-attachments/assets/2e2f2a58-2b28-4d11-afd1-87b65612b2de",
    },
  },
})

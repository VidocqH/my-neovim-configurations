local CONSTANTS = {}
if pcall(require, "../constant") then
  CONSTANTS = require("../constant")
end

local function getDisplayText()
  for i = 1, #CONSTANTS.DISCORD_IGNORE do
    if string.find(vim.fn.getcwd(), CONSTANTS.DISCORD_IGNORE[i]) then
      return {
        workspace_text = "Working on SCP-███",
        -- editing_text = "Editing 🅳🅴🅻🅴🆃🅴🅳"
        editing_text = "Editing 🅲🅾🅽🅵🅸🅳🅴🅽🆃🅸🅰🅻",
        buttons = false,
      }
    end
  end
  return {
    workspace_text = "Working on %s",
    editing_text = "Editing %s",
    buttons = true,
  }
end

local displayText = getDisplayText()
-- The setup config table shows all available config options with their default values:
require("presence"):setup({
  -- General options
  neovim_image_text  = '"Vim, or Neovim, that is the question." By William Shakespeare', -- Text displayed when hovered over the Neovim image
  main_image         = "file",                                                           -- Main image display (either "neovim" or "file")
  enable_line_number = false,                                                            -- Displays the current line number instead of the current project
  blacklist          = {},                                                               -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches

  buttons            = displayText.buttons,                                              -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  workspace_text     = displayText.workspace_text,
  editing_text       = displayText.editing_text,
})

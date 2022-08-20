local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  -- Theme can be overwritten with 'onedark' or 'onelight' as a string
  -- theme = "onedark_vivid",
  theme = "onedark_dark",
  colors = {
    onedark = {
      bg = "#161616",
      red = "#ef596f",
      green = "#89ca78",
      cyan = "#2bbac5",
      purple = "#d55fde",
    },
    cursorline = "#222222"
  }, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  hlgroups = {
    -- Temp Python Highlight
    TSConstructor = { fg = "#19adb9" },
    TSField = { fg = "${red}" }
  }, -- Override default highlight groups
  filetype_hlgroups = {
    yaml = { -- Use the filetype as per the `set filetype?` command
      TSField = { fg = "${red}" }
    },
    python = {
      TSConstructor = { fg = "#19adb9" },
      TSField = { fg = "${red}" },
      TSMethod = { fg = "#579ad1" },
      TSInclude = { fg = "${yellow}" }
    }
  }, -- Override default highlight groups for specific filetypes
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = true, -- When the window is out of focus, change the normal background?
  },
})
-- onedarkpro.load()
vim.cmd("colorscheme onedarkpro")

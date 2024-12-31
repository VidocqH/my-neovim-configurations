local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  -- Theme can be overwritten with 'onedark' or 'onelight' as a string
  -- theme = "onedark_vivid",
  highlights = {
    -- Temp Python Highlight
    ["@constructor"] = { fg = "#19adb9" },
    ["@odp.import_module.python"] = { link = "Type" },
    ["@field"] = { fg = "${red}" },
    ["@field.lua"] = { fg = "${red}" },
    ["@method.python"] = { fg = "#579ad1" },
    ["@include.python"] = { fg = "${yellow}" },
    cursorcolumn = { bg = "${cursorline}" },
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
    cursorline = true, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
    window_unfocused_color = true, -- When the window is out of focus, change the normal background?
    highlight_inactive_windows = false,
  },
})
-- onedarkpro.load()
-- vim.cmd("colorscheme onedark_dark")
-- if vim.o.background ~= "dark" then
--   vim.cmd("colorscheme onelight")
-- else
vim.cmd("colorscheme onedark_dark")
-- end

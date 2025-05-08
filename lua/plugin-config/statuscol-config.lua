local function is_not_outline(arg)
  return vim.bo[arg.buf].filetype ~= "Outline"
end
local function is_neominimap(arg)
  return vim.bo[arg.buf].filetype == "neominimap"
end
local function is_not_neominimap(arg)
  return not is_neominimap(arg)
end

local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true,
  segments = {
    {
      click = "v:lua.ScSa",
      sign = { name = { ".*" } },
      condition = { is_not_neominimap, is_not_outline },
    },
    {
      -- click = "v:lua.ScSa",
      sign = { name = { "dap*", "neotest*" }, maxwidth = 1, auto = true },
      condition = { is_not_neominimap, is_not_outline },
    },
    {
      click = "v:lua.ScSa",
      sign = { namespace = { "gitsigns*" }, colwidth = 1, maxwidth = 1, auto = false },
      condition = { is_not_neominimap, is_not_outline },
    },
    { click = "v:lua.ScFa", text = { builtin.foldfunc }, condition = { is_not_neominimap } },
    { click = "v:lua.ScLa", text = { "%l", " " },        condition = { is_not_neominimap, true } },

    -- NOTE: for neominimap
    {
      sign = { namespace = { "neominimap_search" }, maxwidth = 1, colwidth = 1 },
      condition = { is_neominimap },
    },
    -- {
    --   sign = { namespace = { "neominimap_mark" }, maxwidth = 1, colwidth = 1 },
    --   condition = { is_neominimap },
    -- },
    {
      sign = { namespace = { "neominimap_todo_comment" }, maxwidth = 1, colwidth = 2 },
      condition = { is_neominimap },
    },
    {
      sign = { namespace = { "neominimap_git" }, maxwidth = 1, colwidth = 2, auto = true },
      condition = { is_neominimap },
    },
    {
      sign = { namespace = { "neominimap_fold" }, maxwidth = 1, colwidth = 1, auto = true },
      condition = { is_neominimap },
    },
  },
  clickhandlers = {
    -- Lnum = builtin.lnum_click,
    Lnum = builtin.gitsigns_click,
    FoldClose = builtin.foldclose_click,
    FoldOpen = builtin.foldopen_click,
    FoldOther = builtin.foldother_click,
    DapBreakpointRejected = builtin.toggle_breakpoint,
    DapBreakpoint = builtin.toggle_breakpoint,
    DapBreakpointCondition = builtin.toggle_breakpoint,
    ["diagnostic/signs"] = builtin.diagnostic_click,
    gitsigns = builtin.gitsigns_click,
  },
})

local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true,
  segments = {
    { click = "v:lua.ScSa", sign = { name = { ".*" } } },
    { click = "v:lua.ScSa", sign = { name = { "dap*", "neotest*" }, maxwidth = 1, auto = true } },
    { click = "v:lua.ScSa", sign = { namespace = { "gitsigns*" }, colwidth = 1, maxwidth = 1, auto = false } },
    { click = "v:lua.ScFa", text = { builtin.foldfunc } },
    { click = "v:lua.ScLa", text = { builtin.lnumfunc, " " } },
  },
})

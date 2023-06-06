local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true,
  segments = {
    { click = "v:lua.ScSa", sign = { name = { ".*" } } },
    { click = "v:lua.ScSa", sign = { name = { "GitSigns" }, colwidth = 1, maxwidth = 1 } },
    { click = "v:lua.ScFa", text = { builtin.foldfunc } },
    { click = "v:lua.ScLa", text = { builtin.lnumfunc, " " } },
  },
})

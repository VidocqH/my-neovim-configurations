require'copilot'.setup({
  panel = {
    enabled = false,
    auto_refresh = true,
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
  },
})
require"copilot_cmp".setup()

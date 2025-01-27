local Flash = require("flash")

---@param opts Flash.Format
local function format(opts)
  -- always show first and second label
  return {
    { opts.match.label1, "FlashMatch" },
    { opts.match.label2, "FlashLabel" },
  }
end

Flash.setup({
  modes = {
    char = { jump_labels = true },
    search = { enabled = false },
  },
})

-- Jump To Line
vim.api.nvim_create_user_command("FlashLine", function()
  Flash.jump({
    search = { mode = "search", max_length = 0 },
    label = { after = { 0, 0 } },
    pattern = "^",
  })
end, {})

vim.api.nvim_create_user_command("FlashWord", function()
  Flash.jump({ modes = { char = { jump_labels = true } } })
end, {})

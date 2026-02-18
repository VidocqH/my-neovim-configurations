local cmp = require("cmp")

local cmp_kinds = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
  Copilot = " ",
  Codeium = " ",
  Supermaven = "",
}

-- vim.cmd("highlight Pmenu guibg=#111111")
-- vim.cmd("highlight PmenuSbar guibg=#111111")
vim.cmd("highlight PmenuSel guibg=#181818")
-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
vim.api.nvim_set_hl(0, "CmpItemKindCodeium", { fg = "#aa1111" })
vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- nvim-autopairs work with nvim-cmp
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- cmp.mapping(function()
--   if cmp.get_active_entry() then
--     cmp.confirm()
--   else
--     require'ultimate-autopair.maps.cr'.cmpnewline()
--   end
-- end)

cmp.setup({
  -- snippet engine
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- source
  sources = {
    -- { name = "codeium" },
    -- { name = "supermaven" },
    { name = "nvim_lsp" },
    { name = "render-markdown" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  },

  -- shortcuts
  mapping = require("keybindings").cmp(cmp),
  -- type icons
  formatting = {
    format = function(entry, item)
      item.kind = (cmp_kinds[item.kind] or "") .. item.kind
      local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      return item
    end,
  },

  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({ { name = "path" }, }, { { name = "cmdline" } }),
  mapping = cmp.mapping.preset.cmdline(),
})


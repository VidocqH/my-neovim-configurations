vim.opt.list = true

-- vim.cmd [[highlight IndentBlankLineContextChar guifg=#e5c07b]]

require("ibl").setup({
  indent = { char = "▏" },
  scope = { enabled = false },
  exclude = { filetypes = { "dashboard", "mason", "lazy", "neo-tree", "lspsagaoutline", "aerial" } },
})
-- require("indent_blankline").setup {
-- use_treesitter = true,
-- space_char_blankline = " ",
-- show_current_context = false,
-- show_current_context_start = false,
-- buftype_exclude = { "terminal" },
-- filetype_exclude = { "dashboard", "mason", "lazy", "neo-tree", "lspsagaoutline", "aerial" },
-- }

require("mini.indentscope").setup({
  draw = {
    predicate = function(scope)
      return not scope.body.is_incomplete and vim.bo.filetype ~= "snacks_terminal"
    end,
  },
  symbol = "│",
})

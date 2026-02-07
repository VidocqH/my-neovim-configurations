IS_VSCODE = vim.fn.exists("g:vscode") == 1 and true or false

if IS_VSCODE == false then
  -- you can configure Hop the way you like here; see :h hop-config
  require("nvim-surround").setup({})
  -- require'lsp_signature'.setup({floating_window = false})
  require("fidget").setup({})
  require("trouble").setup({})
  require("mason").setup({ log_level = vim.log.levels.DEBUG })
  require("mason-lspconfig").setup()
  require("dap-python").setup()
  require("dapui").setup()
  require("nvim-dap-virtual-text").setup({})
  require("gomove").setup({ map_defaults = false })
  require("which-key").setup({ preset = "modern", keys = { scroll_up = "", scroll_down = "" } })
  require("nvim-autopairs").setup({ check_ts = true })
  require("nvim-ts-autotag").setup()
  -- require('hlargs').setup()  -- Performance severe
  require("hlslens").setup()
  require("inlay-hints").setup()
  -- require("import-cost").setup()
  -- require("codeium").setup({})
  -- require("scrollview").setup({ excluded_filetypes = { "neo-tree" } })
  require("leetbuddy").setup({ domain = "cn", language = "cpp" })
  require("package-info").setup()
  require("illuminate").configure({
    should_enable = function(bufnr)
      return IS_VSCODE == false
    end,
  })

  vim.cmd("let g:VM_theme='codedark'")
end

require("nvim_comment").setup({
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})

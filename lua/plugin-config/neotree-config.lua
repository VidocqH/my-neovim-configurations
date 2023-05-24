require("neo-tree").setup({
  auto_clean_after_session_restore = true,
  sources = {
    "filesystem",
    -- "buffers",
    "git_status",
    "document_symbols",
  },
  source_selector = {
    winbar = true,
    statusline = false,
    sources = {
      { source = "filesystem" },
      { source = "document_symbols" },
      { source = "git_status" },
    },
  }
})

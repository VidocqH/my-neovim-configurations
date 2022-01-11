require("bufferline").setup {
  options = {
    -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",
    -- use nvim internal lsp
    diagnostics = "nvim_lsp",
    -- Save space for sidebar nvim-tree
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
    }}
  }
}

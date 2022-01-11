require("bufferline").setup {
  options = {
    -- can be a string | function, see "Mouse actions"
    close_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    right_mouse_command = "bdelete! %d",
    -- use nvim internal lsp
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    -- Save space for sidebar nvim-tree
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
    }}
  }
}

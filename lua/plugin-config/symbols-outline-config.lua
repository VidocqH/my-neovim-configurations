-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
-- vim.o.sessionoptions="aerial"

-- Set current line highlight
vim.cmd[[highlight AerialLine guifg=yellow]]

require('aerial').setup({
  on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>AerialToggle!<CR>', {})
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  end,
  highlight_mode = "full_width",
  highlight_on_hover = true,
  show_guides = true,
  manage_folds = true,
  close_behavior = "close",
  -- link_folds_to_tree = true,
})

local opt = {noremap = true, silent = true }

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Sidebar nvim-tree file explorer toggler
map('n', '<leader>b', '<cmd>NvimTreeToggle<CR>')

-- BufferLine Magic Picker
map('n', '<leader>p', '<cmd>BufferPick<CR>')

-- Bufferline Closer
map('n', '<leader>w', '<cmd>BufferClose<CR>')

-- bufferline tab switcher
map("n", "<C-h>", "<cmd>BufferPrevious<CR>")
map("n", "<C-l>", "<cmd>BufferNext<CR>")

-- bufferline tab jumper
map("n", "<leader>1", "<cmd>BufferGoto 1<CR>")
map("n", "<leader>2", "<cmd>BufferGoto 2<CR>")
map("n", "<leader>3", "<cmd>BufferGoto 3<CR>")
map("n", "<leader>4", "<cmd>BufferGoto 4<CR>")
map("n", "<leader>5", "<cmd>BufferGoto 5<CR>")
map("n", "<leader>6", "<cmd>BufferGoto 6<CR>")
map("n", "<leader>7", "<cmd>BufferGoto 7<CR>")
map("n", "<leader>8", "<cmd>BufferGoto 8<CR>")
map("n", "<leader>9", "<cmd>BufferGoto 9<CR>")

-- Telescope Shortcuts
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")

-- Hop Shortcuts
map("", "<leader><leader>w", "<cmd>HopWord<CR>", {})
map("", "<leader><leader>j", "<cmd>HopLine<CR>", {})
map("", "<leader><leader>k", "<cmd>HopLine<CR>", {})
map('', '<leader><leader>l', "<cmd>HopWordCurrentLineAC<CR>", {})
map('', '<leader><leader>h', "<cmd>HopWordCurrentLineBC<CR>", {})
map('n', 'f', "<cmd>HopChar1CurrentLineAC<CR>", {})
map('n', 'F', "<cmd>HopChar1CurrentLineBC<CR>", {})
map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
map('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})


-- Floating Terminal Shortcuts
map('', "<leader><leader>ftc", "<cmd>FloatermNew<CR>")
map('', "<leader><leader>ftp", "<cmd>FloatermPrev<CR>")
map('', "<leader><leader>ftn", "<cmd>FloatermNext<CR>")
map('', "<leader><leader>ftt", "<cmd>FloatermToggle<CR>")
map('t', "<leader><leader>ftt", "<cmd>FloatermToggle<CR>")

map('', "<leader>s", "<cmd>SymbolsOutline<CR>")

-- Move Shortcuts
map('n', '<A-j>', "<cmd>MoveLine(1)<CR>", { noremap = true, silent = true })
map('n', '<A-k>', "<cmd>MoveLine(-1)<CR>", { noremap = true, silent = true })
map('v', '<A-j>', "<cmd>MoveBlock(1)<CR>", { noremap = true, silent = true })
map('v', '<A-k>', "<cmd>MoveBlock(-1)<CR>", { noremap = true, silent = true })
map('n', '<A-l>', "<cmd>MoveHChar(1)<CR>", { noremap = true, silent = true })
map('n', '<A-h>', "<cmd>MoveHChar(-1)<CR>", { noremap = true, silent = true })
map('v', '<A-l>', "<cmd>MoveHBlock(1)<CR>", { noremap = true, silent = true })
map('v', '<A-h>', "<cmd>MoveHBlock(-1)<CR>", { noremap = true, silent = true })

-- SnipRun Shortcuts
map('v', '<leader>rr', '<cmd>SnipRun<CR>', {silent = true})
map('n', '<leader>rr', '<cmd>SnipRunOperator<CR>', {silent = true})
map('n', '<leader>rrr', '<cmd>SnipRun<CR>', {silent = true})

-- Dashboard Shortcuts
map('', '<leader>ss', '<cmd><C-u>SessionSave<CR>')
map('', '<leader>sl', '<cmd><C-u>SessionLoad<CR>')
map('n', '<leader>tc', '<cmd>DashboardChangeColorscheme<CR>', { silent = true })
map('n', '<leader>cn', '<cmd>DashboardNewFile<CR>', { silent = true })

local pluginKeys = {}

-- nvim-cmp auto complete
pluginKeys.cmp = function(cmp)
  return {
    -- previous item
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- next item
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- toggler completion
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- cancel
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- select
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

-- LSP related keybindings
pluginKeys.maplsp = function(mapbuf)
  -- rename
  -- mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  mapbuf('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opt)
  -- code action
  -- mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  mapbuf('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>" , opt)
  mapbuf('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>" , opt)
  -- go xx
  -- mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  -- mapbuf('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opt)
  mapbuf('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opt)
  mapbuf('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>" , opt)
  mapbuf('n', '<C-n>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>" , opt)
  mapbuf('n', '<C-p>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>" , opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  -- mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  -- mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  -- mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  mapbuf("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
return pluginKeys



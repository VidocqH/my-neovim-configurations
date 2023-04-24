local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Sidebar nvim-tree file explorer toggler
map('', '<leader>n', '<cmd>NvimTreeToggle<CR>')

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
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map("n", "<leader>fc", "<CMD>Telescope commands<CR>")
map("n", "<leader>fa", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Hop Shortcuts
map("", "<leader><leader>w", "<cmd>HopWord<CR>", {})
-- map("", "<leader><leader>j", "<cmd>HopLineAC<CR>", {})
-- map("", "<leader><leader>k", "<cmd>HopLineBC<CR>", {})
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

-- Trouble Toggle
map('', "<leader><leader>t", "<cmd>TroubleToggle<CR>")

-- Move Shortcuts
map("n", "<A-h>", "<Plug>GoNSMLeft", {})
map("n", "<A-j>", "<Plug>GoNSMDown", {})
map("n", "<A-k>", "<Plug>GoNSMUp", {})
map("n", "<A-l>", "<Plug>GoNSMRight", {})
map("x", "<A-h>", "<Plug>GoVSMLeft", {})
map("x", "<A-j>", "<Plug>GoVSMDown", {})
map("x", "<A-k>", "<Plug>GoVSMUp", {})
map("x", "<A-l>", "<Plug>GoVSMRight", {})

-- Dashboard Shortcuts
map('', '<leader>ss', '<cmd><C-u>SessionSave<CR>')
map('', '<leader>sl', '<cmd><C-u>SessionLoad<CR>')
map('n', '<leader>tc', '<cmd>DashboardChangeColorscheme<CR>', { silent = true })
map('n', '<leader>cn', '<cmd>DashboardNewFile<CR>', { silent = true })

-- Dap keybindings
map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>") -- N
map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>") -- S
map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>") -- F
map("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
map("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")

-- dap-ui
map("n", "<Leader>gui", "<cmd>lua require('dapui').toggle()<CR>")

-- hlslens minimal configurations
map('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
map('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
map('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]])
map('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]])
map('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]])
map('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]])
map('n', '<Leader>l', ':noh<CR>')


-- Aerial symbols outline
map('n', '<leader>s', '<cmd>AerialToggle!<CR>')
-- Jump forwards/backwards with '{' and '}'
map('n', '{', '<cmd>AerialPrev<CR>')
map('n', '}', '<cmd>AerialNext<CR>')
-- Jump up the tree with '[[' or ']]'
map('n', '[[', '<cmd>AerialPrevUp<CR>')
map('n', ']]', '<cmd>AerialNextUp<CR>')

local pluginKeys = {}

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

-- nvim-cmp auto complete
pluginKeys.cmp = function(cmp)
  return {
    -- previous item
    ['<Up>'] = cmp.mapping.select_prev_item(),
    -- next item
    ['<Down>'] = cmp.mapping.select_next_item(),
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
    ['<Tab>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

local opt = { silent = true }
-- LSP related keybindings
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", opt)
  -- code action
  mapbuf('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>" , opt)
  mapbuf('v', '<leader>ca', "<cmd>Lspsaga code_action<CR>" , opt)
  -- go xx
  -- mapbuf('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", sagaopt)
  mapbuf('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", opt)
  mapbuf('n', 'gh', "<cmd>Lspsaga lsp_finder<CR>", opt)
  mapbuf('n', 'K', "<cmd>Lspsaga hover_doc<CR>" , opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- Outline
  mapbuf('n','<leader>S', "<cmd>Lspsaga outline<CR>", opt)
  -- diagnostic
  mapbuf("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
  -- Call hierarchy
  -- mapbuf('n', "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
  -- mapbuf('n', "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
end
return pluginKeys



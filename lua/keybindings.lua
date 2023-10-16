---@param mode string | table<string>
---@param lhs string
---@param rhs string
---@param opts? table<string, any>
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

local function checkTab()
  local pos = vim.api.nvim_win_get_cursor(0)
  local row, col = pos[1], pos[2]
  local indents = require("nvim-treesitter.indent").get_indent(row)
  local putChars = (col == 0 and indents > 0) and string.rep(" ", indents)
      or vim.api.nvim_replace_termcodes("<Tab>", true, true, true)

  vim.api.nvim_put({ putChars }, "c", true, true)
end

vim.keymap.set("i", "<Tab>", checkTab, nil)

-- Sidebar nvim-tree file explorer toggler
-- map('', '<leader>n', '<cmd>NvimTreeFindFileToggle<CR>')
map('', '<leader>n', '<cmd>Neotree toggle reveal<CR>')

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

-- bufferline tab mover
map("n", "<A-[>", "<cmd>BufferMovePrevious<CR>")
map("n", "<A-]>", "<cmd>BufferMoveNext<CR>")

-- hls keybindings
map("", "<leader>l", "<cmd>noh<CR>")

-- Telescope Shortcuts
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>fF", "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map("n", "<leader>fc", "<CMD>Telescope commands<CR>")
map("n", "<leader>fa", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- Flash
map("", "<leader><leader>j", "<CMD>FlashLine<CR>", {})
map("", "<leader><leader>k", "<CMD>FlashLine<CR>", {})
map("", "<leader><leader>w", "<CMD>FlashWord<CR>", {})
map({ "n", "o", "x" }, "<CR>", "<CMD>lua require('flash').treesitter()<CR>", {})

-- Trouble Toggle
map('', "<leader><leader>t", "<cmd>TroubleToggle<CR>")

-- Color Picker
map('n', "<leader><leader>c", "<cmd>CccPick<CR>")

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
map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")  -- F
map("n", "<leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
map("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")

-- dap-ui
map("n", "<Leader>gui", "<cmd>lua require('dapui').toggle()<CR>")

-- Aerial symbols outline
map('n', '<leader>s', '<cmd>AerialToggle!<CR>')
-- Jump forwards/backwards with '{' and '}'
map('n', '{', '<cmd>AerialPrev<CR>')
map('n', '}', '<cmd>AerialNext<CR>')
-- Jump up the tree with '[[' or ']]'
map('n', '[[', '<cmd>AerialPrevUp<CR>')
map('n', ']]', '<cmd>AerialNextUp<CR>')

local pluginKeys = {}
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
      select = true,
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
  mapbuf('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", opt)
  mapbuf('v', '<leader>ca', "<cmd>Lspsaga code_action<CR>", opt)
  -- go xx
  -- mapbuf('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", sagaopt)
  mapbuf('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", opt)
  mapbuf('n', 'gh', "<cmd>Lspsaga finder<CR>", opt)
  mapbuf('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opt)
  -- mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>Lspsaga goto_definition<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- Outline
  mapbuf('n', '<leader>S', "<cmd>Lspsaga outline<CR>", opt)
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

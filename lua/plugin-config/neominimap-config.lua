vim.opt.wrap = false
vim.opt.sidescrolloff = 36

---@type Neominimap.Map.Handler
local todo_comments_handler = {
  name = "Todo Comment",
  mode = "icon",
  -- mode = "line",
  namespace = vim.api.nvim_create_namespace("neominimap_todo_comment"),
  init = function() end,
  autocmds = {
    {
      event = { "TextChanged", "TextChangedI" },
      opts = {
        callback = function(apply, args)
          local bufnr = tonumber(args.buf) ---@cast bufnr integer
          vim.schedule(function()
            apply(bufnr)
          end)
        end,
      },
    },
    {
      event = "WinScrolled",
      opts = {
        callback = function(apply)
          local winid = vim.api.nvim_get_current_win()
          if not winid or not vim.api.nvim_win_is_valid(winid) then
            return
          end
          local bufnr = vim.api.nvim_win_get_buf(winid)
          vim.schedule(function()
            if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
              apply(bufnr)
            end
          end)
        end,
      },
    },
  },
  get_annotations = function(bufnr)
    local ok, _ = pcall(require, "todo-comments")
    if not ok then
      return {}
    end
    local ns_id = vim.api.nvim_get_namespaces()["todo-comments"]
    local extmarks = vim.api.nvim_buf_get_extmarks(bufnr, ns_id, 0, -1, {
      details = true,
    })
    local icons = {
      FIX = " ",
      TODO = " ",
      HACK = " ",
      WARN = " ",
      PERF = " ",
      NOTE = " ",
      TEST = "⏲ ",
    }
    local id = { FIX = 1, TODO = 2, HACK = 3, WARN = 4, PERF = 5, NOTE = 6, TEST = 7 }
    return vim.tbl_map(function(extmark) ---@param extmark vim.api.keyset.get_extmark_item
      local detail = extmark[4] ---@type vim.api.keyset.extmark_details
      local group = detail.hl_group ---@type string
      local kind = string.sub(group, 7)
      local icon = icons[kind]
      ---@type Neominimap.Map.Handler.Annotation
      return {
        lnum = extmark[2],
        end_lnum = extmark[2],
        id = id[kind],
        highlight = "TodoFg" .. kind, --- You can customize the highlight here.
        -- highlight = detail.hl_group,
        icon = icons[kind],
        priority = detail.priority + 9999,
      }
    end, extmarks)
  end,
}

-- local statuscol = require("statuscol")
-- _G.NeominimapStatusCol = function()
--   local ok, _ = pcall(require, "statuscol") -- Make sure statuscol is installed and loaded.
--   if ok then
--     return statuscol.get_statuscol_string()
--     -- return _G.StatusCol()  -- For version 0.10
--   else
--     return ""
--   end
-- end

---@type Neominimap.UserConfig
vim.g.neominimap = {
  auto_enable = true,
  float = { z_index = 20 },
  click = { enabled = true, auto_switch_focus = false },
  search = { enabled = true, mode = "icon" },
  mark = { enabled = false },
  handlers = { todo_comments_handler },
  exclude_filetypes = { "dashboard" },
  buf_filter = function(bufnr)
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    return line_count <= 8192 --- disable minimap for large files
  end,
}

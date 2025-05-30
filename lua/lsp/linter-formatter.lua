local CONSTANTS = require("../constant_template")
if pcall(require, "../constant") then
  CONSTANTS = require("../constant")
end

local function is_ignored(bufnr)
  local buffer_name = vim.api.nvim_buf_get_name(bufnr)
  for i = 1, #CONSTANTS.AUTO_FORMAT_IGNORE do
    if string.find(buffer_name, CONSTANTS.AUTO_FORMAT_IGNORE[i]) then
      return true
    end
  end
  return false
end

-- Suppress warning
local notify = vim.notify
notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
  notify(msg, ...)
end

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(bufnr, "textDocument/formatting", vim.lsp.util.make_formatting_params({}), function(err, res, ctx)
    if err then
      local err_msg = type(err) == "string" and err or err.message
      -- you can modify the log message / level (or ignore it completely)
      vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
      return
    end

    -- don't apply results if buffer is unloaded or has been modified
    if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
      return
    end

    if res then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("silent noautocmd update")
      end)
    end
  end)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls = require("null-ls")
null_ls.setup({
  -- sources = {
  --   -- Typescript & Javascript
  --   -- null_ls.builtins.code_actions.eslint_d,
  --   -- null_ls.builtins.diagnostics.eslint_d,
  --   -- null_ls.builtins.formatting.eslint_d,
  --   null_ls.builtins.formatting.prettierd,
  --   -- Git
  --   null_ls.builtins.diagnostics.gitlint,
  --   null_ls.builtins.code_actions.gitsigns,
  --   -- Python
  --   null_ls.builtins.formatting.black,
  --   -- C & C++
  --   -- null_ls.builtins.formatting.clang_format,
  --   -- null_ls.builtins.diagnostics.cpplint.with({
  --   --   args = { "--linelength=120", "$FILENAME" },
  --   -- }),
  --   -- Prisma
  --   null_ls.builtins.formatting.prisma_format,
  --   -- Lua
  --   null_ls.builtins.formatting.stylua,
  -- },
  on_attach = function(client, bufnr)
    if is_ignored(bufnr) == false and client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- Suppress warning
local notify = vim.notify
notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    notify(msg, ...)
end

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- Typescript & Javascript
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
    -- Git
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.code_actions.gitsigns,
    -- Python
    -- null_ls.builtins.diagnostics.pylint.with({
    --   diagnostics_postprocess = function(diagnostic)
    --     diagnostic.code = diagnostic.message_id
    --   end,
    -- }),
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.autopep8,
    -- C & C++
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.diagnostics.cpplint.with ({
      args = { "--linelength=120", "$FILENAME" }
    }),
  },
})

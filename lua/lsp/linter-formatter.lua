local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.diagnostics.pylint.with({
    --   diagnostics_postprocess = function(diagnostic)
    --     diagnostic.code = diagnostic.message_id
    --   end,
    -- }),
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.clang_format,
  },
})

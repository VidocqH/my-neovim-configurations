-- vim.lsp.set_log_level("debug")
vim.lsp.set_log_level("off")

local function get_typescript_server_path(root_dir)
  local project_root = vim.fs.dirname(vim.fs.find("node_modules/typescript/lib", { path = root_dir, upward = true })[1])
  return project_root and (project_root .. "/lib") or ""
end

local function lsp_settings(server_name)
  if server_name == "lua_ls" then
    return require("lsp.lsp_settings.lua_ls")
  elseif server_name == "ts_ls" then
    return require("lsp.lsp_settings.tsserver")
  elseif server_name == "basedpyright" then
    return require("lsp.lsp_settings.basedpyright")
  end
  return nil
end

-- Diagnostics Sign
local signs = { Error = " ", Warn = " ", Hint = "󰰂 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({ virtual_text = { prefix = "●" } })

local dap_servers = {
  "debugpy",
  "vscode-node-debug2",
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  require("keybindings").maplsp(buf_set_keymap) -- Bind shortcut
end

-- cmp-nvim lsp setup
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config("mdx_analyzer", {
  on_new_config = function(new_config, new_root_dir)
    if vim.tbl_get(new_config.init_options, "typescript") and not new_config.init_options.typescript.tsdk then
      new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    end
  end,
})
vim.lsp.config("lua_ls", { settings = require("lsp.lsp_settings.lua_ls") })
-- vim.lsp.config("ts_ls", {
--   settings = require("lsp.lsp_settings.tsserver"),
--   root_markers = { ".git" },
-- })
vim.lsp.config("tsgo", {
  settings = require("lsp.lsp_settings.tsserver"),
  root_markers = { ".git" },
})
vim.lsp.config("basedpyright", { settings = require("lsp.lsp_settings.basedpyright") })

require("mason").setup()
require("mason-lspconfig").setup({ automatic_enable = { exclude = { "ts_ls" } } })

-- require("mason-lspconfig").setup_handlers({
--   function(server_name)
--     if server_name == "mdx_analyzer" then
--       require("lspconfig").mdx_analyzer.setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--         on_new_config = function(new_config, new_root_dir)
--           if vim.tbl_get(new_config.init_options, "typescript") and not new_config.init_options.typescript.tsdk then
--             new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
--           end
--         end,
--       })
--       return
--     end
--     require("lspconfig")[server_name].setup({
--       on_attach = on_attach,
--       capabilities = capabilities,
--       settings = lsp_settings(server_name),
--     })
--   end,
-- })

-- Load clangd lsp with extension
require("clangd_extensions").setup({
  ast = {
    role_icons = {
      type = "",
      declaration = "",
      expression = "",
      specifier = "",
      statement = "",
      ["template argument"] = "",
    },
    kind_icons = {
      Compound = "",
      Recovery = "",
      TranslationUnit = "",
      PackExpansion = "",
      TemplateTypeParm = "",
      TemplateTemplateParm = "",
      TemplateParamObject = "",
    },
  },
})

vim.opt.laststatus = 3

local ENDPOINT_PREFIX = require("utils").get_configs().AVANTE_ENDPOINT_PREFIX
if ENDPOINT_PREFIX == nil then
end

-- deps:
require("cmp").setup({})
require("img-clip").setup({})
require("avante_lib").load()

---@class avante.Config
require("avante").setup({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  provider = "claude",
  auto_suggestions_provider = "claude",
  -- claude = {
  --   -- endpoint = "https://api.anthropic.com",
  --   -- endpoint = ENDPOINT_PREFIX .. "anthropic",
  --   model = "claude-3-5-sonnet-latest",
  -- },
  -- openai = {
  --   endpoint = ENDPOINT_PREFIX .. "openai",
  -- },
  -- vendors = {
  --   deepseek = {
  --     __inherited_from = "openai",
  --     api_key_name = "DEEPSEEK_API_KEY",
  --     endpoint = "https://api.deepseek.com",
  --     model = "deepseek-coder",
  --   },
  -- },
  providers = {
    claude = {
      endpoint = "https://www.dmxapi.cn",
      model = "claude-haiku-4-5-20251001",
      -- model = "claude-sonnet-4-5-20250929",
    },
  },

  -- MCP Hub setup
  system_prompt = function()
    local hub = require("mcphub").get_hub_instance()
    return hub and hub:get_active_servers_prompt() or ""
  end,
  -- Using function prevents requiring mcphub before it's loaded
  custom_tools = function()
    return {
      require("mcphub.extensions.avante").mcp_tool(),
    }
  end,

  -- hints = { enabled = true },
  -- windows = {
  --   ---@type "right" | "left" | "top" | "bottom"
  --   position = "right", -- the position of the sidebar
  --   wrap = true, -- similar to vim.o.wrap
  --   width = 30, -- default % based on available width
  --   sidebar_header = {
  --     enabled = true, -- true, false to enable/disable the header
  --     align = "center", -- left, center, right for title
  --     rounded = true,
  --   },
  -- },
})

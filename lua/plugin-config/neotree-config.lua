require("neo-tree").setup({
  auto_clean_after_session_restore = true,
  sources = {
    "filesystem",
    -- "buffers",
    "git_status",
    "document_symbols",
  },
  source_selector = {
    winbar = true,
    statusline = false,
    sources = {
      { source = "filesystem" },
      { source = "document_symbols" },
      { source = "git_status" },
    },
  },
  filesystem = {
    follow_current_file = { enabled = true },
    commands = {
      avante_add_files = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local relative_path = require("avante.utils").relative_path(filepath)

        local sidebar = require("avante").get()

        local open = sidebar:is_open()
        -- ensure avante sidebar is open
        if not open then
          require("avante.api").ask()
          sidebar = require("avante").get()
        end

        sidebar.file_selector:add_selected_file(relative_path)

        -- remove neo tree buffer
        if not open then
          sidebar.file_selector:remove_selected_file("neo-tree filesystem [1]")
        end
      end,
    },
    window = {
      mappings = {
        ["oa"] = "avante_add_files",
      },
    },
  },
})

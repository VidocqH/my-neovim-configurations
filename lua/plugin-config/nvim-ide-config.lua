-- default components
local bufferlist      = require('ide.components.bufferlist')
local explorer        = require('ide.components.explorer')
local outline         = require('ide.components.outline')
local callhierarchy   = require('ide.components.callhierarchy')
local timeline        = require('ide.components.timeline')
local terminal        = require('ide.components.terminal')
local terminalbrowser = require('ide.components.terminal.terminalbrowser')
local changes         = require('ide.components.changes')
local commits         = require('ide.components.commits')
local branches        = require('ide.components.branches')
local bookmarks       = require('ide.components.bookmarks')

-- require('ide').setup({
--     icon_set = "codicon", -- values: "nerd", "codicon", "default"
--     -- workspaces config
--     workspaces = {
--         -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
--         auto_open = 'none',
--     },
-- })

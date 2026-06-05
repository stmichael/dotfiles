local workspaces = require("workspaces")

-- Workspaces
hl.workspace_rule({ workspace = "1" })
hl.workspace_rule({ workspace = "2" })
hl.workspace_rule({ workspace = "3" })
hl.workspace_rule({ workspace = "4" })
hl.workspace_rule({ workspace = "5" })

hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1200@60.0",
  position = "0x0",
  scale    = "1.0",
})

local function monitors_changed()
  workspaces.apply()
end

monitors_changed()

hl.on("monitor.added", monitors_changed)
hl.on("monitor.removed", monitors_changed)


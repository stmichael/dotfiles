-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

-- Screensharing selection
hl.window_rule({
  name = "screensharing-picker",
  match = {
    class = "hyprland-share-picker",
  },
  float = true,
})

-- Electron
hl.window_rule({
  name = "electron-focus-floating-windows",
  match = {
    float = 1,
    class = "electron",
  },
  stay_focused = true,
})
hl.window_rule({
  name = "electron-save-as-window",
  match = {
    class = "electron",
    title = "^(Save As)$",
  },
  float = true,
})

-- Google meet
hl.window_rule({
  name = "google-meet-float-screen-sharing-window",
  match = {
    title = ".*is sharing a window\\.",
  },
  move = { "((monitor_w*1)-window_w-10)", "(100)" },
})
hl.window_rule({
  name = "google-meet-float-screen-sharing-window-2",
  match = {
    title = ".*is sharing your screen\\.",
  },
  move = { "((monitor_w*1)-window_w-10)", "(100)" },
})
hl.window_rule({
  name = "google-meet-float-picture-in-picture",
  match = {
    class = "brave-browser",
    title = "^Meet -.*$",
  },
  float = true,
})

-- Brave
hl.window_rule({
  name = "brave-float-save-as",
  match = {
    class = "brave",
    title = "^(.*wants to save)$",
  },
  float = true,
  size = { "(monitor_w*0.7)", "(monitor_h*0.7)" },
})
hl.window_rule({
  name = "brave-float-open",
  match = {
    class = "brave",
    title = "^(.*wants to open)$",
  },
  float = true,
  size = { "(monitor_w*0.7)", "(monitor_h*0.7)" },
})
hl.window_rule({
  name = "brave-float-save-dialog",
  match = {
    class = "brave",
    title = "^Save File$",
  },
  float = true,
  size = { "(monitor_w*0.7)", "(monitor_h*0.7)" },
})
hl.window_rule({
  name = "brave-float-bitwarden-windows",
  match = {
    class = "^brave.*",
    title = "Bitwarden",
  },
  float = true,
})

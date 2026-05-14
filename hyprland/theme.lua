hl.config({
  general = {
    gaps_in = 1,
    gaps_out = 1,

    border_size = 2,

    -- col = {
    --   active_border = $lavender
    --   inactive_border = $overlay0
    -- }

    resize_on_border = false,
    allow_tearing = false,
  },

  group = {
      auto_group = true,
      -- col.border_active = $lavender
      -- col.border_inactive = $overlay0
      -- col.border_locked_active = $lavender
      -- col.border_locked_inactive = $overlay0

  },

  decoration = {
    rounding = 0,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = false,
    },

    blur = {
      enabled = false,
    },
  },

  animations = {
    enabled = false,
  },

  misc = {
    force_default_wallpaper = 1,
    disable_hyprland_logo   = true,
    disable_splash_rendering = true,
  },
})

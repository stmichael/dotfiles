hl.config({
  general = {
    gaps_in = 1,
    gaps_out = 1,

    border_size = 2,

    col = {
      active_border = theme.border.active,
      inactive_border = theme.border.inactive
    },

    resize_on_border = false,
    allow_tearing = false,
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
    enabled = true,
  },

  misc = {
    force_default_wallpaper  = 1,
    disable_hyprland_logo    = true,
    disable_splash_rendering = true,
  },
})

hl.animation({ leaf = "global", enabled = true, speed = 3, bezier = "default" })

hl.config({
  input = {
    kb_layout  = "us,ch",
    kb_variant = "dvp",
    kb_model   = "",
    kb_options = "compose:ralt",
    kb_rules   = "",
    repeat_delay = 200,
    repeat_rate = 35,

    follow_mouse = 2,

    sensitivity = 0.4,

    touchpad = {
        natural_scroll = false,
    },
  },
})


hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

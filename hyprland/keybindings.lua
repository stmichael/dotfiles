local mainMod = "SUPER"

-- Window focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + n", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + c", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + t", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + n", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + c", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + t", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + f", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces
hl.bind(mainMod .. " + r", hl.dsp.focus({ workspace = "r+1", on_current_monitor = true }))
hl.bind(mainMod .. " + g", hl.dsp.focus({ workspace = "r-1", on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + r", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + g", hl.dsp.window.move({ workspace = "r-1" }))

-- Monitor focus
hl.bind(mainMod .. " + CTRL + h", hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + n", hl.dsp.focus({ monitor = "r" }))
hl.bind(mainMod .. " + CTRL + SHIFT + h", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + n", hl.dsp.window.move({ monitor = "r" }))

-- Applications
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(terminal))

-- Termination
-- lid is closed
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("~/bin/monitor disable eDP-1 --safe"))
-- lid is opened
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("~/bin/monitor enable eDP-1"))

hl.bind(mainMod .. " + q", hl.dsp.submap("terminate"))
hl.define_submap("terminate", function()
  hl.bind("escape", hl.dsp.submap("reset"))

  hl.bind("c", function()
    hl.dispatch(hl.dsp.window.kill({ window = "activewindow" }))
    hl.dispatch(hl.dsp.submap("reset"))
  end)
  hl.bind("l", function()
    hl.dispatch(hl.dsp.exec_cmd("hyprlock"))
    hl.dispatch(hl.dsp.submap("reset"))
  end)
  hl.bind("F1", hl.dsp.exec_cmd("systemctl poweroff"))
  hl.bind("F2", hl.dsp.exec_cmd("systemctl reboot"))
  hl.bind("F3", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))
end)

-- Keyboard layout
hl.bind(mainMod .. " + l", hl.dsp.exec_cmd("hyprctl switchxkblayout keyd-virtual-keyboard next"))

-- Screenshot
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window -m active"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Bluetooth
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(terminal .. " bluetuith"))

-- Clipboard
hl.bind(mainMod .. " + v", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Monitors
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))

hl.bind(mainMod .. " + m", hl.dsp.submap("monitor"))
hl.define_submap("monitor", function()
  hl.bind("escape", hl.dsp.submap("reset"))

  hl.bind("r", hl.dsp.exec_cmd("brightnessctl s 5%+"))
  hl.bind("g", hl.dsp.exec_cmd("brightnessctl s 5%-"))
  hl.bind("dollar", function()
    hl.dispatch(hl.dsp.exec_cmd("wlrlui -m"))
    hl.dispatch(hl.dsp.submap("reset"))
  end)
end)

-- # Sound
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = false })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = false })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + s", hl.dsp.submap("sound"))
hl.define_submap("sound", function()
  hl.bind("escape", hl.dsp.submap("reset"))

  -- Volume control
  hl.bind("r", hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
  hl.bind("g", hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
  hl.bind("c", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = false })
  hl.bind(mainMod .. " + r", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 20%+"))
  hl.bind(mainMod .. " + g", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 20%-"))
  hl.bind(mainMod .. " + c", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = false })

  -- Multimedia control
  hl.bind("n", hl.dsp.exec_cmd("playerctl next"), { locked = true })
  hl.bind("t", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
  hl.bind("h", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
  hl.bind("s", hl.dsp.exec_cmd(terminal .. " -e ncpamixer"), { locked = true })
end)


local M = {}

PRESENTATION_MONITOR_PATTERNS = {
  "MeetUp",
  "Samsung Electric Company SAMSUNG 0x01000E00"
}

local function get_active_monitors()
  local active_monitors = {}
  for _, monitor in ipairs(hl.get_monitors()) do
    if (monitor.dpms_status) then
      table.insert(active_monitors, monitor)
    end
  end
  return active_monitors
end

local function move_workspace_to_monitor(workspace_id, monitor_id)
  hl.dispatch(hl.dsp.workspace.move({
    workspace = workspace_id,
    monitor = monitor_id,
  }))
end

local function find_laptop_monitor(monitors)
  for _, monitor in ipairs(monitors) do
    if (monitor.name == "eDP-1") then
      return monitor
    end
  end
end

local function find_non_laptop_monitors(monitors)
  local other_monitors = {}
  for _, monitor in ipairs(monitors) do
    if (monitor.name ~= "eDP-1") then
      table.insert(other_monitors, monitor)
    end
  end
  return other_monitors
end

local function is_presentation_monitor(monitor)
  for _, pattern in ipairs(PRESENTATION_MONITOR_PATTERNS) do
    if string.match(monitor.description, pattern) then
      return true
    end
  end
  return false
end

local function find_presentation_monitor(monitors)
  for _, monitor in ipairs(monitors) do
    if is_presentation_monitor(monitor) then
      return monitor
    end
  end
  return nil
end

function M.apply()
  local monitors = get_active_monitors()
  if #monitors == 1 then
    M.apply_one_monitor_layout()
  elseif #monitors == 2 then
    if find_presentation_monitor(monitors) ~= nil then
      M.apply_presentation_layout()
    else
      M.apply_two_monitor_layout()
    end
  elseif #monitors == 3 then
    M.apply_three_monitor_layout()
  else
    hl.dispatch(hl.dsp.exec_cmd("notify-send 'Cannot apply workspaces to " .. #monitors .. " monitors'"))
  end
end

function M.apply_one_monitor_layout()
  local monitors = get_active_monitors()
  local laptop_monitor = find_laptop_monitor(monitors)
  move_workspace_to_monitor(1, laptop_monitor.id)
  move_workspace_to_monitor(2, laptop_monitor.id)
  move_workspace_to_monitor(3, laptop_monitor.id)
  move_workspace_to_monitor(4, laptop_monitor.id)
  move_workspace_to_monitor(5, laptop_monitor.id)

  hl.dispatch(hl.dsp.exec_cmd("notify-send 'One monitor layout'"))
end

function M.apply_two_monitor_layout()
  local monitors = get_active_monitors()
  if #monitors < 2 then
    hl.dispatch(hl.dsp.exec_cmd("notify-send -u critical 'Only " .. #monitors .. " monitor(s) available'"))
    return
  end

  local laptop_monitor = find_laptop_monitor(monitors)
  local other_monitor = find_non_laptop_monitors(monitors)[1]

  move_workspace_to_monitor(1, laptop_monitor.name)
  move_workspace_to_monitor(2, other_monitor.id)
  move_workspace_to_monitor(3, other_monitor.id)
  move_workspace_to_monitor(4, other_monitor.id)
  move_workspace_to_monitor(5, other_monitor.id)

  hl.dispatch(hl.dsp.exec_cmd("notify-send 'Two monitor layout'"))
end

function M.apply_presentation_layout()
  local monitors = get_active_monitors()
  if #monitors < 2 then
    hl.dispatch(hl.dsp.exec_cmd("notify-send -u critical 'Only " .. #monitors .. " monitor(s) available'"))
    return
  end

  local laptop_monitor = find_laptop_monitor(monitors)
  local other_monitor = find_non_laptop_monitors(monitors)[1]

  move_workspace_to_monitor(1, laptop_monitor.name)
  move_workspace_to_monitor(2, laptop_monitor.id)
  move_workspace_to_monitor(3, laptop_monitor.id)
  move_workspace_to_monitor(4, other_monitor.id)
  move_workspace_to_monitor(5, laptop_monitor.id)

  hl.dispatch(hl.dsp.exec_cmd("notify-send 'Presentation layout'"))
end

function M.apply_three_monitor_layout()
  local monitors = get_active_monitors()
  if #monitors < 3 then
    hl.dispatch(hl.dsp.exec_cmd("notify-send -u critical 'Only " .. #monitors .. " monitor(s) available'"))
    return
  end

  local laptop_monitor = find_laptop_monitor(monitors)
  local other_monitor1 = find_non_laptop_monitors(monitors)[1]
  local other_monitor2 = find_non_laptop_monitors(monitors)[2]

  move_workspace_to_monitor(1, laptop_monitor.name)
  move_workspace_to_monitor(2, other_monitor1.id)
  move_workspace_to_monitor(3, other_monitor1.id)
  move_workspace_to_monitor(4, other_monitor2.id)
  move_workspace_to_monitor(5, other_monitor2.id)

  hl.dispatch(hl.dsp.exec_cmd("notify-send 'Three monitor layout'"))
end

return M

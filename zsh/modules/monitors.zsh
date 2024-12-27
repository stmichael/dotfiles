monitor-setup-laptop() {
  local name=$1
  rm ~/.config/hypr/monitors.conf
  ln -sf ~/.config/hypr/monitors/laptop-only.conf ~/.config/hypr/monitors.conf
  hyprctl reload
}

monitor-setup-home() {
  local name=$1
  rm ~/.config/hypr/monitors.conf
  ln -sf ~/.config/hypr/monitors/home-dual.conf ~/.config/hypr/monitors.conf
  hyprctl reload
}

monitor-setup-custom() {
  local name=$1
  rm ~/.config/hypr/monitors.conf
  ln -sf ~/.config/hypr/monitors/custom.conf ~/.config/hypr/monitors.conf
  hyprctl reload
}

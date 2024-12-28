monitor-setup-laptop() {
  # Move workspaces to monitors
  hyprctl dispatch moveworkspacetomonitor 1 desc:Chimei Innolux Corporation 0x145A
  hyprctl dispatch moveworkspacetomonitor 2 desc:Chimei Innolux Corporation 0x145A
  hyprctl dispatch moveworkspacetomonitor 3 desc:Chimei Innolux Corporation 0x145A
  hyprctl dispatch moveworkspacetomonitor 4 desc:Chimei Innolux Corporation 0x145A
  # Update workspacerules so that waybar detects the assignments
  hyprctl keyword workspace 1, desc:Chimei Innolux Corporation 0x145A
  hyprctl keyword workspace 2, desc:Chimei Innolux Corporation 0x145A
  hyprctl keyword workspace 3, desc:Chimei Innolux Corporation 0x145A
  hyprctl keyword workspace 4, desc:Chimei Innolux Corporation 0x145A
}

monitor-setup-home() {
  # Move workspaces to monitors
  hyprctl dispatch moveworkspacetomonitor 1 desc:Chimei Innolux Corporation 0x145A
  hyprctl dispatch moveworkspacetomonitor 2 desc:BNQ BenQ PD2710QC RAJ0256801Q
  hyprctl dispatch moveworkspacetomonitor 3 desc:BNQ BenQ PD2710QC RAJ0256801Q
  hyprctl dispatch moveworkspacetomonitor 4 desc:BNQ BenQ PD2710QC RAJ0256801Q
  # Update workspacerules so that waybar detects the assignments
  hyprctl keyword workspace 1, desc:Chimei Innolux Corporation 0x145A
  hyprctl keyword workspace 2, desc:BNQ BenQ PD2710QC RAJ0256801Q
  hyprctl keyword workspace 3, desc:BNQ BenQ PD2710QC RAJ0256801Q
  hyprctl keyword workspace 4, desc:BNQ BenQ PD2710QC RAJ0256801Q
}

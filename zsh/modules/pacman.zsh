alias pac-update='sudo pacman -Syu'
alias yay-update='yay -Syu'

firmware-update() {
  fwupdmgr refresh
  fwupdmgr get-updates
  fwupdmgr update
}

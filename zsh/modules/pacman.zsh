alias pac-update='sudo pacman -Syu'
alias yay-update='yay -Syu --noconfirm --answerdiff=None --answeredit=None'

firmware-update() {
  fwupdmgr refresh
  fwupdmgr get-updates
  fwupdmgr update
}

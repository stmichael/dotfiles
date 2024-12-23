# ls
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -a'

# git
alias ga='git add'
alias gm='git merge --no-ff'
alias gs='git status -b'
alias gl='git pull'
alias gf='git fetch'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gb='git branch'
alias gg='git log --graph'
alias gco='git checkout'

# docker
alias dcup='docker compose up'
alias dcdown='docker compose down'
alias dcx='docker compose exec'

# kubernetes
alias k='kubectl'

# USB
usb-mount() {
  sudo mount --mkdir -o gid=users,fmask=113,dmask=002 /dev/sda /mnt/usbstick
  echo "USB device available at /mnt/usbstick"
}

usb-umount() {
  sudo umount /mnt/usbstick
}

# NordVPN
nord-connect() {
  local country=$1

  ps -a | grep openvpn > /dev/null
  if [[ $? -eq 0 ]]; then
    echo "OpenVPN is already running"
  else
    # disable IPv6
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

    local file=$(ls -1 ~/.config/nordvpn/profiles/ovpn_udp/$country* | shuf -n 1)
    echo "Connecting using config $file"
    sudo openvpn --config $file --auth-user-pass ~/.config/nordvpn/service-credentials &!
    sleep 2
  fi
}

nord-disconnect() {
  ps -a | grep openvpn | awk '{ print $1 }' | xargs -I {} sudo kill {}
}

nord-update() {
  mkdir -p ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip 2> /dev/null
  curl -o ~/.config/nordvpn/profiles/ovpn.zip https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
  unzip ~/.config/nordvpn/profiles/ovpn.zip -d ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip
}

# NAS
nas-mount() {
  sudo mount --mkdir -t nfs -o vers=4 192.168.0.20:/volume1/homes/stmichael /mnt/nas
  echo "NAS available at /mnt/nas"
}

nas-umount() {
  sudo umount /mnt/nas
}

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
usbmount() {
  sudo mkdir -p /mnt/usbstick
  sudo mount -o gid=users,fmask=113,dmask=002 /dev/sda /mnt/usbstick
}

usbumount() {
  sudo umount /mnt/usbstick
}

# NordVPN
nordconnect() {
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

norddisconnect() {
  ps -a | grep openvpn | awk '{ print $1 }' | xargs -I {} sudo kill {}
}

nordupdate() {
  mkdir -p ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip 2> /dev/null
  curl -o ~/.config/nordvpn/profiles/ovpn.zip https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
  unzip ~/.config/nordvpn/profiles/ovpn.zip -d ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip
}

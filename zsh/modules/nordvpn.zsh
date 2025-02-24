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
    ( sudo openvpn --config $file --auth-user-pass ~/.config/nordvpn/service-credentials > /dev/null 2>&1 & )
    sleep 2
  fi
}

nord-disconnect() {
  sudo killall openvpn
  sleep 2
}

nord-update() {
  rm -rf ~/.config/nordvpn/profiles
  mkdir -p ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip
  curl -o ~/.config/nordvpn/profiles/ovpn.zip https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
  unzip ~/.config/nordvpn/profiles/ovpn.zip -d ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip
}

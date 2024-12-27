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
  sleep 2
}

nord-update() {
  mkdir -p ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip 2> /dev/null
  curl -o ~/.config/nordvpn/profiles/ovpn.zip https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
  unzip ~/.config/nordvpn/profiles/ovpn.zip -d ~/.config/nordvpn/profiles
  rm -f ~/.config/nordvpn/profiles/ovpn.zip
}

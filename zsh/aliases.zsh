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

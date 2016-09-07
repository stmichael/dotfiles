# general
alias ll='ls -lah'
alias la='ls -a'
alias ..='cd ..'
alias ....='cd ../..'

# git
alias ga='git add'
alias gaa='git add .'
alias gm='git merge --no-ff'
alias gs='git status -b'
alias gl='git pull'
alias gf='git fetch'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gg='git log --graph'
alias gco='git checkout'

# rails
alias rc='bin/rails c'
alias rs='bin/rails s'
alias rg='bin/rails g'
alias cpw='bin/cucumber -p wip'
alias rake='noglob rake'
alias bundle='noglob bundle'
alias be='bundle exec'

# karma
alias karma='node_modules/karma/bin/karma start -single-run karma.coffee'

function c () {
  cd ~/Projects/$1;
}
function _c () {
  _files -W ~/Projects -/
}
compdef _c c
alias c='nocorrect c'

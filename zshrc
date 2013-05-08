export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="kennethreitz"
export DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(organization osx emacs git ruby rails brew gem torquebox)

source $ZSH/oh-my-zsh.sh


. $HOME/.zsh/aliases

# Customize to your needs...
alias cls='clear'
alias glg='git log --graph'

PATH=/Library/PostgreSQL8/bin:$PATH
export PATH


unsetopt auto_name_dirs
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=/usr/local/bin:$PATH

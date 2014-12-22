. ~/.zsh/autocompletion.zsh
. ~/.zsh/history.zsh


# Enable colors
autoload colors; colors;
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
setopt prompt_subst


. ~/.zsh/theme.zsh

# Key configuration

bindkey "^[[3~" delete-char


# User configuration

. $HOME/.zsh/aliases

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

eval "$(rbenv init - zsh)"

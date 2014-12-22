# initialize autocompletion
autoload -U compinit
compinit

# add git autocompletion
fpath=(~/.zsh/git $fpath)

# make autocompletion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

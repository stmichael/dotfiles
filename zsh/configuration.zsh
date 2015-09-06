# Enable colors
autoload colors; colors;
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
setopt prompt_subst

# Key configuration
bindkey "^[[3~" delete-char

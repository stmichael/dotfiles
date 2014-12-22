# Enable colors
autoload colors; colors;
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
setopt prompt_subst

# Key configuration
bindkey "^[[3~" delete-char

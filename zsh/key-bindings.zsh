# Generic
bindkey "\e[3~" delete-char

# Menu selection
bindkey -M menuselect '^[h' vi-backward-char
bindkey -M menuselect '^[c' vi-up-line-or-history
bindkey -M menuselect '^[t' vi-down-line-or-history
bindkey -M menuselect '^[n' vi-forward-char
bindkey -M menuselect '^[ ' accept-line

# Auto suggestion
bindkey '^[ ' autosuggest-accept

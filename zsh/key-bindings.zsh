# Cursor movement
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Text modification
bindkey "^[[3~" delete-char

# Menu selection
bindkey -M menuselect '^[h' vi-backward-char
bindkey -M menuselect '^[c' vi-up-line-or-history
bindkey -M menuselect '^[t' vi-down-line-or-history
bindkey -M menuselect '^[n' vi-forward-char
bindkey -M menuselect '^[ ' accept-line

# Auto suggestion
bindkey '^[ ' autosuggest-accept

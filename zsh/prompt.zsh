prompt_status() {
  [[ $1 -eq 0 ]] && print "\uf00c\n#AAC987" || print "\uf467\n#E55B57"
}

prompt_user() {
  print "%n\n#F1B969"
}

prompt_working_dir() {
  print "%~\n#42A5F5"
}

prompt_git() {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1
  local is_repo=$?

  if [[ $is_repo -eq 0 ]]
  then
    local branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    local git_status=$(git status --porcelain)
    print "\ue725 $branch $([[ -z $git_status ]] && print "\uf00c" || print "\uea73")\n#46AFA5"
  fi
}

prompt_k8s() {
  local context
  context=$(kubectl config current-context 2> /dev/null)
  if [[ $? -eq 0 ]]
  then
    print "\ue81d $context\n#B775C0"
  fi
}

# Usage: echo "text1\nred\ntext2\ngreen" | style_left

# Reads lines in pairs. The first line is used as the text to display,
# the second line is its color.

# The function outputs the pairs as arrows that can be placed as the left prompt.
style_left() {
  local text
  local color
  local new_color

  IFS=$'\n'
  read -r text
  read -r color
  if [[ -n $text ]]
  then
    print -n "%{%K{$color}%F{black}%} $text "
    while read -r text; do
      read -r new_color
      print -n "%{%K{$new_color}%F{$color}%}\ue0b0%{%K{$new_color}%F{black}%} $text "
      color=$new_color
    done
    print -n "%{%K{black}%F{$color}%}\ue0b0%{%k%f%}"
  fi
}

# Usage: echo "text1\nred\ntext2\ngreen" | style_right

# Reads lines in pairs. The first line is used as the text to display,
# the second line is its color.

# The function outputs the pairs as arrows that can be placed as the right prompt.
style_right() {
  local text
  local color
  local new_color

  IFS=$'\n'
  read -r text
  read -r color
  if [[ -n $text ]]
  then
    print -n "%{%K{black}%F{$color}%}\ue0b2%{%K{$color}%F{black}%} $text "
    while read -r text; do
      read -r new_color
      print -n "%{%K{$color}%F{$new_color}%}\ue0b2%{%K{$new_color}%F{black}%} $text "
      color=$new_color
    done
    print -n "%{%k%f%}"
  fi
}

build_left_prompt() {
  prompt_status $1
  prompt_user
  prompt_working_dir
}

build_right_prompt() {
  prompt_git
  prompt_k8s
}

# Usage: prompt-length TEXT [COLUMNS]
#
# If you run `print -P TEXT`, how many characters will be printed
# on the last line?
#
# Or, equivalently, if you set PROMPT=TEXT with prompt_subst
# option unset, on which column will the cursor be?
#
# The second argument specifies terminal width. Defaults to the
# real terminal width.
#
# The result is stored in REPLY.
#
# Assumes that `%{%}` and `%G` don't lie.
#
# Examples:
#
#   prompt-length ''            => 0
#   prompt-length 'abc'         => 3
#   prompt-length $'abc\nxy'    => 2
#   prompt-length '❎'          => 2
#   prompt-length $'\t'         => 8
#   prompt-length $'\u274E'     => 2
#   prompt-length '%F{red}abc'  => 3
#   prompt-length $'%{a\b%Gb%}' => 1
#   prompt-length '%D'          => 8
#   prompt-length '%1(l..ab)'   => 2
#   prompt-length '%(!.a.)'     => 1 if root, 0 if not
function prompt-length() {
  emulate -L zsh
  local -i COLUMNS=${2:-COLUMNS}
  local -i x y=${#1} m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ))
    done
    while (( y > x + 1 )); do
      (( m = x + (y - x) / 2 ))
      (( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
    done
  fi
  echo $x
}

# Usage: fill-line LEFT RIGHT
#
# Sets REPLY to LEFT<spaces>RIGHT with enough spaces in
# the middle to fill a terminal line.
function fill-line() {
  emulate -L zsh
#   prompt-length $1
  local -i left_len=$(prompt-length $1)
#   prompt-length $2 9999
  local -i right_len=$(prompt-length $2 9999)
  local -i pad_len=$((COLUMNS - left_len - right_len - ${ZLE_RPROMPT_INDENT:-1}))
  if (( pad_len < 1 )); then
    # Not enough space for the right part. Drop it.
    echo "$1"
  else
    local pad=${(pl.$pad_len.. .)}  # pad_len spaces
    echo "${1}${pad}${2}"
  fi
}

# Sets PROMPT and RPROMPT.
#
# Requires: prompt_percent and no_prompt_subst.
function set-prompt() {
  RETVAL=$?

  local top_left="$(build_left_prompt $RETVAL | style_left)"
  local top_right="$(build_right_prompt | style_right)"
  local bottom_left='╰─ '

  PROMPT=$(fill-line "$top_left" "$top_right")$'\n'$bottom_left
}

setopt no_prompt_{bang,subst} prompt_{cr,percent,sp}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt

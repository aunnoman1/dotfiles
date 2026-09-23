#!/bin/sh
# tmux popup: fuzzy session switcher (prefix + f)
sel=$(tmux list-sessions -F '#{session_name}' \
  | fzf --layout=reverse --info=inline --border=rounded --margin=1 --padding=1 \
        --color=bg:#1e1e2e,fg:#cdd6f4,hl:#cba6f7,pointer:#f9e2af,marker:#a6e3a1,prompt:#89b4fa,border:#cba6f7 \
        --prompt=' sessions ')
[ -n "$sel" ] && tmux switch-client -t "$sel"
exit 0

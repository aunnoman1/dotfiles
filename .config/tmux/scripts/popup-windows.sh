#!/bin/sh
# tmux popup: fuzzy jump to any window in any session (prefix + g)
sel=$(tmux list-windows -a -F '#{session_name}:#{window_index} #{window_name}' \
  | fzf --layout=reverse --info=inline --border=rounded --margin=1 --padding=1 \
        --color=bg:#1e1e2e,fg:#cdd6f4,hl:#cba6f7,pointer:#f9e2af,marker:#a6e3a1,prompt:#89b4fa,border:#cba6f7 \
        --prompt=' windows ')
[ -n "$sel" ] || exit 0
t=${sel%% *}
tmux switch-client -t "${t%%:*}" 2>/dev/null
tmux select-window -t "$t"
exit 0

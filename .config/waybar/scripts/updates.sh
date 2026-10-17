#!/usr/bin/env bash
# Pending pacman + AUR updates for waybar (JSON); hidden when there are none.
repo=$(checkupdates 2>/dev/null | wc -l)
aur=$(yay -Qua 2>/dev/null | wc -l)
total=$((repo + aur))
[ "$total" -eq 0 ] && { echo '{"text":""}'; exit 0; }
printf '{"text":"󰏗 %s","tooltip":"%s repo, %s AUR\\nClick to update","class":"pending"}\n' "$total" "$repo" "$aur"

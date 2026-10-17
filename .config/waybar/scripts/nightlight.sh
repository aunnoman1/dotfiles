#!/usr/bin/env bash
# Night light (hyprsunset) indicator/toggle for waybar.
#   nightlight.sh          -> print JSON
#   nightlight.sh toggle   -> warm <-> neutral
#   nightlight.sh up|down  -> +/- 250K
# 6500K is treated as "off" (hyprsunset doesn't report identity mode reliably).
warm=4000
cur=$(hyprctl hyprsunset temperature 2>/dev/null | tr -dc '0-9')
[ -z "$cur" ] && { echo '{"text":"󰖨","tooltip":"hyprsunset not running","class":"off"}'; exit 0; }

set_temp() {
    hyprctl hyprsunset temperature "$1" >/dev/null
    pkill -RTMIN+10 waybar
}

case "$1" in
    toggle) [ "$cur" -lt 6500 ] && set_temp 6500 || set_temp $warm ;;
    up)     set_temp $(( cur + 250 > 6500 ? 6500 : cur + 250 )) ;;
    down)   set_temp $(( cur - 250 < 2500 ? 2500 : cur - 250 )) ;;
    *)
        if [ "$cur" -lt 6500 ]; then
            printf '{"text":"󰖔","tooltip":"Night light %sK\\nClick: off · Scroll: adjust","class":"on"}\n' "$cur"
        else
            printf '{"text":"󰖨","tooltip":"Night light off\\nClick: on · Scroll: adjust","class":"off"}\n'
        fi ;;
esac

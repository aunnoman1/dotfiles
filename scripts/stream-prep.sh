#!/usr/bin/env bash
# Sunshine "do" command: create the headless output. Needs: jq

OUT="HEADLESS-1"
W="${SUNSHINE_CLIENT_WIDTH:-1920}"
H="${SUNSHINE_CLIENT_HEIGHT:-1080}"
FPS="${SUNSHINE_CLIENT_FPS:-60}"

# Remember where you are so focus can be restored afterwards
PREV_MON=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
PREV_WS=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .activeWorkspace.id')

# Clear any stale output from a previous session, then create a fresh one.
# (hyprctl prints "ok", not the output name, so we use our own fixed name.)
hyprctl output remove "$OUT" >/dev/null 2>&1
hyprctl output create headless "$OUT" >/dev/null

# Wait until Hyprland actually lists the new monitor
for _ in $(seq 30); do
    hyprctl monitors -j | jq -e --arg n "$OUT" '.[] | select(.name == $n)' >/dev/null && break
    sleep 0.1
done

# Resolution/refresh from the Moonlight client; placed far away from real monitors
hyprctl eval "hl.monitor({ output = \"${OUT}\", mode = \"${W}x${H}@${FPS}\", position = \"10000x0\", scale = 1 })"

# Bind workspace 99 to the headless output and instantiate it there
hyprctl eval "hl.workspace_rule({ workspace = \"99\", monitor = \"${OUT}\", default = true, gaps_in = 0, gaps_out = 0, no_border = true, no_rounding = true })"
sleep 0.2
hyprctl dispatch "hl.dsp.focus({ monitor = \"${OUT}\" })"
hyprctl dispatch "hl.dsp.focus({ workspace = \"99\" })"

# Give focus back to whatever you were using
hyprctl dispatch "hl.dsp.focus({ monitor = \"${PREV_MON}\" })"
hyprctl dispatch "hl.dsp.focus({ workspace = \"${PREV_WS}\" })"

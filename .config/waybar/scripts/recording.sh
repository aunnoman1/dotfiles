#!/usr/bin/env bash
# Red dot + elapsed time while ~/.local/bin/record-toggle is recording.
pidfile="${XDG_RUNTIME_DIR:-/tmp}/record.pid"
if [ -f "$pidfile" ] && kill -0 "$(cat "$pidfile")" 2>/dev/null; then
    secs=$(( $(date +%s) - $(stat -c %Y "$pidfile") ))
    printf '{"text":"● %02d:%02d","tooltip":"Recording — click to stop","class":"recording"}\n' $((secs / 60)) $((secs % 60))
else
    echo '{"text":""}'
fi

#!/usr/bin/env bash
# Sunshine "cmd": runs gamescope + Steam. Stays in the foreground while streaming.

W="${SUNSHINE_CLIENT_WIDTH:-1920}"
H="${SUNSHINE_CLIENT_HEIGHT:-1080}"
FPS="${SUNSHINE_CLIENT_FPS:-60}"

export PULSE_SINK="Game_Stream_Sink"
export PIPEWIRE_NODE="Game_Stream_Sink"

if ! pactl list short sinks | grep -q "Game_Stream_Sink"; then
    echo "warning: sink Game_Stream_Sink not found, audio will go to the default sink" >&2
fi

# If Steam is already running on your desktop, a second 'steam' call would just
# hand off to that instance and exit, so close it first.
if pgrep -x steam >/dev/null; then
    steam -shutdown
    for _ in $(seq 30); do
        pgrep -x steam >/dev/null || break
        sleep 1
    done
fi

# exec so Sunshine tracks gamescope itself

gamescope -W $W -H $H -w $W -h $H -r $FPS -e -f -- \
    steam -gamepadui \
    -cef-disable-gpu-compositing \
    -no-shared-subsystem \
    -no-bluetooth \
    --disable-features=WebBluetooth,WebBluetoothNewPermissionsBackend \
    "$@"

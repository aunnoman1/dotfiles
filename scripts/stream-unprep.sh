#!/usr/bin/env bash
# Sunshine "undo" command: shut down the stream session and remove the output.

for out in $(hyprctl monitors -j | jq -r '.[] | select(.name | startswith("HEADLESS")) | .name'); do
    hyprctl output remove "$out" >/dev/null 2>&1
done

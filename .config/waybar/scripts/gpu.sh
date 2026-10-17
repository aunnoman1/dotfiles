#!/usr/bin/env bash
# NVIDIA GPU usage/temperature for waybar (JSON).
IFS=', ' read -r util temp mem total < <(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total --format=csv,noheader,nounits)
class=normal; [ "$temp" -ge 80 ] && class=critical
printf '{"text":"󰢮 %s%% %s°C","tooltip":"GPU %s%%\\nTemp %s°C\\nVRAM %s / %s MiB","class":"%s"}\n' "$util" "$temp" "$util" "$temp" "$mem" "$total" "$class"

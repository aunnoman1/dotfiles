#!/usr/bin/env bash
# One-time setup: share the wired connection over Wi-Fi (NetworkManager hotspot).
# Afterwards: nmcli con up Hotspot / nmcli con down Hotspot
#
# Intel AX210 refuses to start a standalone 5 GHz AP (firmware "no-IR"), so this
# uses 2.4 GHz. Password is prompted for so it never lands in this public repo.
set -euo pipefail

IFACE="${IFACE:-wlp39s0}"
SSID="${SSID:-optix69}"
CHANNEL="${CHANNEL:-1}"
COUNTRY="${COUNTRY:-PK}"

# dnsmasq: DHCP for NM's "shared" mode. wireless-regdb: without it the kernel
# falls back to the restrictive world regdomain.
sudo pacman -S --needed wireless-regdb iw dnsmasq
sudo sed -i "s/^#WIRELESS_REGDOM=\"$COUNTRY\"/WIRELESS_REGDOM=\"$COUNTRY\"/" /etc/conf.d/wireless-regdom
sudo iw reg set "$COUNTRY"

read -rsp "Hotspot password for $SSID (8+ chars): " PSK
echo

nmcli con delete Hotspot >/dev/null 2>&1 || true
nmcli con add type wifi ifname "$IFACE" con-name Hotspot autoconnect no ssid "$SSID" \
  802-11-wireless.mode ap 802-11-wireless.band bg 802-11-wireless.channel "$CHANNEL" \
  802-11-wireless.powersave 2 \
  wifi-sec.key-mgmt wpa-psk wifi-sec.proto rsn wifi-sec.pairwise ccmp wifi-sec.group ccmp \
  wifi-sec.psk "$PSK" \
  ipv4.method shared ipv6.method disabled

echo "Done. Start with: nmcli con up Hotspot"

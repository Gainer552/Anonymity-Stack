#!/bin/bash

VPN_CONFIG_DIR="$HOME/Documents/Anonymity-Stack-main/VPNs"
ROTATE_INTERVAL=180

# Detect backend
if command -v nmcli >/dev/null && systemctl is-active --quiet NetworkManager; then
    BACKEND="networkmanager"
else
    BACKEND="wg-quick"
fi

CONFIG_FILES=("$VPN_CONFIG_DIR"/*.conf)

if [ ${#CONFIG_FILES[@]} -eq 0 ]; then
    echo "No WireGuard configs found in $VPN_CONFIG_DIR"
    exit 1
fi

CURRENT_CONFIG=""

# NetworkManager backend
if [ "$BACKEND" = "networkmanager" ]; then
    echo "Using NetworkManager backend"

    # Import configs if not already imported
    for f in "${CONFIG_FILES[@]}"; do
        NAME="$(basename "$f" .conf)"
        if ! nmcli -t -f NAME connection show | grep -qx "$NAME"; then
            nmcli connection import type wireguard file "$f"
        fi
    done

    # Get all WireGuard connections from NM
    mapfile -t NM_CONNS < <(
        nmcli -t -f NAME,TYPE connection show | awk -F: '$2=="wireguard"{print $1}'
    )

    if [ ${#NM_CONNS[@]} -eq 0 ]; then
        echo "No WireGuard connections found in NetworkManager"
        exit 1
    fi

    while true; do
        NEXT="${NM_CONNS[$RANDOM % ${#NM_CONNS[@]}]}"
        echo "Selected config: $NEXT"

        # FIX: ensure only ONE WireGuard VPN is active
        mapfile -t ACTIVE_WG < <(
            nmcli -t -f NAME,TYPE connection show --active |
            awk -F: '$2=="wireguard"{print $1}'
        )

        for c in "${ACTIVE_WG[@]}"; do
            nmcli connection down "$c"
        done

        echo "Starting VPN..."
        nmcli --wait 10 connection up "$NEXT"
        CURRENT_CONFIG="$NEXT"

        echo "VPN active. Waiting $ROTATE_INTERVAL seconds..."
        sleep "$ROTATE_INTERVAL"
    done
fi

# wg-quick fallback backend
echo "Using wg-quick backend"

if ! command -v wg-quick >/dev/null; then
    echo "wg-quick not found. Install wireguard-tools first."
    exit 1
fi

stop_vpn() {
    if [ -n "$CURRENT_CONFIG" ]; then
        echo "Stopping VPN: $CURRENT_CONFIG"
        sudo wg-quick down "$CURRENT_CONFIG"
    fi
}

while true; do
    CONFIG_FILE="${CONFIG_FILES[$RANDOM % ${#CONFIG_FILES[@]}]}"
    echo "Selected config: $CONFIG_FILE"

    stop_vpn
    sleep 2

    echo "Starting VPN..."
    sudo wg-quick up "$CONFIG_FILE"
    CURRENT_CONFIG="$CONFIG_FILE"

    echo "VPN active. Waiting $ROTATE_INTERVAL seconds..."
    sleep "$ROTATE_INTERVAL"
done
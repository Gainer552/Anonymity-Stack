#!/bin/bash

# Define the folder containing your WireGuard config files.
VPN_CONFIG_DIR="Anonymity-Stack"

# Define the interval to rotate VPNs (in seconds), adjust as necessary.
ROTATE_INTERVAL=180

# Check if the config directory exists.
if [ ! -d "$VPN_CONFIG_DIR" ]; then
    echo "VPN config directory does not exist: $VPN_CONFIG_DIR"
    exit 1
fi

# Array of config files.
CONFIG_FILES=("$VPN_CONFIG_DIR"/*.conf)

# Check if there are any .conf files in the directory.
if [ ${#CONFIG_FILES[@]} -eq 0 ]; then
    echo "No WireGuard config files found in $VPN_CONFIG_DIR"
    exit 1
fi

# Function to start WireGuard VPN using a specific config.
start_vpn() {
    local config_file="$1"
    echo "Starting VPN using config: $config_file"
    sudo wg-quick up "$config_file"
}

# Function to stop the current VPN.
stop_vpn() {
    echo
    echo "Stopping current VPN..."
    echo
    sudo wg-quick down "$1"
}

# Rotate VPNs indefinitely.
while true; do
    # Choose a random config file from the available ones.
    echo
    CONFIG_FILE="${CONFIG_FILES[$RANDOM % ${#CONFIG_FILES[@]}]}"
    echo
    
# Extract the config file name without the path.
    echo
    CONFIG_NAME=$(basename "$CONFIG_FILE")
    echo
    
# Stop any active VPN (if any).
    echo
    stop_vpn "$CONFIG_NAME"
    echo

# Wait for a moment before starting the new VPN.
    sleep 2

# Start a new VPN connection with the chosen config.
    echo
    start_vpn "$CONFIG_NAME"
    echo

# Wait for the defined interval before rotating.
    echo
    echo "VPN rotation complete. Waiting for $ROTATE_INTERVAL seconds..."
    echo
    sleep "$ROTATE_INTERVAL"
done

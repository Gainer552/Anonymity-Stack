#!/bin/bash

# Proxy Chain Script

# Function to check if a proxy is reachable
check_proxy() {
    local proxy=$1
    local timeout=5
    if nc -zv -w $timeout $(echo $proxy | cut -d':' -f1) $(echo $proxy | cut -d':' -f2) 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to create a proxy chain
create_proxy_chain() {
    local proxies=("$@")
    local chain=""

    for proxy in "${proxies[@]}"; do
        if check_proxy $proxy; then
            chain+="socks5h://$proxy "
        else
            echo "Proxy $proxy is not reachable. Skipping."
        fi
    done

    if [ -z "$chain" ]; then
        echo "No reachable proxies found."
        exit 1
    fi

    echo "Creating proxy chain with: $chain"

    # Set the proxy chain in environment variables
    export http_proxy="socks5h://$chain"
    export https_proxy="socks5h://$chain"

    echo "Proxy chain set. Use 'curl' or 'wget' with the -x option to test."
}

# Main script execution
echo "Enter the proxies in the format proxy:port, separated by spaces:"
read -a proxies

if [ ${#proxies[@]} -lt 2 ]; then
    echo "Please enter at least two proxies."
    exit 1
fi

create_proxy_chain "${proxies[@]}"
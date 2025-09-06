#!/bin/bash

# Function to install aes-crypt
install_aes_crypt() {
    if command -v aes-crypt >/dev/null 2>&1; then
        echo "aes-crypt is already installed."
    else
        echo "Installing aes-crypt..."
        sudo pacman -S --needed --noconfirm aes-crypt
    fi
}

# Function to encrypt a file
encrypt_file() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: $0 encrypt <file> <password>"
        exit 1
    fi

    local file=$1
    local password=$2

    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        exit 1
    fi

    echo "Encrypting $file..."
    aes-crypt -e -p "$password" "$file"
    if [ $? -eq 0 ]; then
        echo "Encryption successful."
    else
        echo "Encryption failed."
    fi
}

# Function to decrypt a file
decrypt_file() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: $0 decrypt <file> <password>"
        exit 1
    fi

    local file=$1
    local password=$2

    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        exit 1
    fi

    echo "Decrypting $file..."
    aes-crypt -d -p "$password" "$file"
    if [ $? -eq 0 ]; then
        echo "Decryption successful."
    else
        echo "Decryption failed."
    fi
}

# Main script execution
install_aes_crypt

if [ "$1" == "encrypt" ]; then
    encrypt_file "$2" "$3"
elif [ "$1" == "decrypt" ]; then
    decrypt_file "$2" "$3"
else
    echo "Usage: $0 [encrypt|decrypt] <file> <password>"
    exit 1
fi
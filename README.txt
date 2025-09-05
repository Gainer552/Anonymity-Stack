MAC Address Randomizer Script


Description
This script continuously changes (randomizes) the MAC address of your 
wireless network interface (wlan0) every 3 minutes (180 seconds).
It uses the macchanger tool to randomize the MAC address.

Requirements
1. Linux operating system
2. "ifconfig" (usually provided by net-tools).
3. "macchanger" (must be installed separately).

Installation
1. Install required tools:
   - On Debian/Ubuntu: sudo apt update && sudo apt install net-tools macchanger.
   - On Fedora/CentOS: sudo dnf install net-tools macchanger.
   - On Arch: sudo pacman -S net-tools macchanger.

2. Save the script to a file, for example: rm.sh.
3. Make the script executable: chmod +x rm.sh.

Usage
- Run the script with: ./random-mac.sh.

=======================================================================================================================

WireGuard VPN Rotation Script

Description
This program automatically rotates between multiple WireGuard VPN 
configurations on a timed interval. It selects a random configuration 
file from a specified directory, disconnects the current VPN, and 
connects to the new one. This helps improve privacy by regularly 
changing VPN endpoints.

Requirements
1. Linux operating system.
2. WireGuard installed and configured.
3. A directory containing valid WireGuard configuration files (.conf).

Installation
1. Save the program to a file (e.g., rvpn.sh).
2. Make the file executable using: chmod +x rotate-vpn.sh.
3. Ensure your WireGuard configuration files are stored in the directory 
   defined inside the program (default is Anonymity-Stack), or 
   update the path if needed.

Usage
Run the program with: ./rvpn.sh

Since WireGuard requires administrative privileges, you may need: sudo ./rvpn.sh

Notes & Warnings
- The program will disconnect and reconnect your VPN at each rotation, 
  which may temporarily interrupt network traffic.
- Ensure that your configuration files are valid and tested before use.
- Frequent VPN rotations may cause issues with some online services 
  (e.g., banking, streaming, or authentication systems).
- The rotation interval can be adjusted inside the program (default: 
  every 3 minutes).

=======================================================================================================================

Legal Disclaimer
Anonymity Stack is provided strictly for educational, research, and 
privacy-enhancing purposes. By using this software, you acknowledge and 
agree to the following:

1. Responsibility  
   - You are solely responsible for how you use Anonymity Stack.  
   - The author(s) accept no liability for any damages, losses, or legal 
     consequences resulting from its use.  

2. Compliance with Laws and Policies  
   - You must ensure that your use of Anonymity Stack complies with all 
     applicable local, national, and international laws.  
   - You are also responsible for complying with the terms of service, 
     acceptable use policies, and rules of any networks, service 
     providers, or systems you connect to while using this software.  

3. Network and Service Impact  
   - Anonymity Stack alters network identifiers and VPN connections in 
     ways that may cause disruptions.  
   - Use only on systems and networks where you have explicit permission 
     and understand the potential consequences.  

4. No Warranty  
   - Anonymity Stack is provided "as-is," without any express or implied 
     warranties of any kind, including but not limited to warranties of 
     merchantability, fitness for a particular purpose, or 
     non-infringement.  

By downloading, installing, or using Anonymity Stack, you confirm that 
you understand this disclaimer and accept full responsibility for your 
actions.

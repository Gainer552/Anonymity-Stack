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

======================================================================================================================

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

======================================================================================================================

NanoCrypt

NanoCrypt is a powerful and user-friendly command-line tool for encrypting and decrypting files using the AES (Advanced Encryption Standard) algorithm. Designed with privacy and security in mind, NanoCrypt ensures that your sensitive data remains protected from unauthorized access.

Features
- Secure Encryption: Uses the AES encryption standard to ensure robust data protection.
- Easy to Use: Simple command-line interface for encrypting and decrypting files.
- Automatic Installation: Checks for and installs `aes-crypt` if not already present on your system.
- Cross-Platform: Works seamlessly on Arch Linux and other Linux distributions.

Installation
NanoCrypt is designed to work on Arch Linux. To install and use NanoCrypt, follow these steps:

1. Clone the Repository:
   git clone https://github.com/Gainer552/Anonymity-Stack.git
2. cd Anonymity-Stack

2. Make the Script Executable: chmod +x nano_crypt.sh

3. Run the Script:
- To encrypt a file: ./nano_crypt.sh encrypt /path/to/your/file.txt yourpassword
- To decrypt a file: ./nano_crypt.sh decrypt /path/to/your/file.txt.aes yourpassword

Usage

Encrypting a File
To encrypt a file, use the following command:./nano_crypt.sh encrypt /path/to/your/file.txt yourpassword
Replace "/path/to/your/file.txt" with the path to the file you want to encrypt, and "yourpassword" with your chosen password.

Decrypting a File
To decrypt a file, use the following command: ./nano_crypt.sh decrypt /path/to/your/file.txt.aes yourpassword
Replace "/path/to/your/file.txt.aes" with the path to the encrypted file, and "yourpassword" with the password used for encryption.

Requirements
- Arch Linux or a compatible Linux distribution.
- aes-crypt package, which will be installed automatically if not already present.

LEGAL DISCLAIMER

THIS SOFTWARE IS PROVIDED "AS IS," WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

USE OF THIS SOFTWARE IMPLIES ACCEPTANCE OF THIS DISCLAIMER. IF YOU DO NOT AGREE TO THE TERMS OF THIS DISCLAIMER, DO NOT USE THIS SOFTWARE.

THE AUTHORS AND CONTRIBUTORS MAKE NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. THE SOFTWARE IS PROVIDED "AS IS," AND YOU USE IT AT YOUR OWN RISK.

THE AUTHORS AND CONTRIBUTORS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

YOU ASSUME ALL RESPONSIBILITY AND RISK FOR YOUR USE OF THE SOFTWARE, INCLUDING ANY INSTALLATION, CONFIGURATION, AND OPERATION THEREOF. YOU ARE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM OR OTHER PROPERTY THAT MAY RESULT FROM YOUR USE OF THE SOFTWARE.

THIS SOFTWARE MAY CONTAIN BUGS, ERRORS, OR OTHER PROBLEMS THAT COULD LEAD TO UNEXPECTED BEHAVIOR OR DATA LOSS. THE AUTHORS AND CONTRIBUTORS DO NOT GUARANTEE THAT THE SOFTWARE WILL MEET YOUR REQUIREMENTS OR THAT IT WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR-FREE.

YOU ARE RESPONSIBLE FOR BACKING UP YOUR DATA AND FOR SECURING YOUR COMPUTER SYSTEM AGAINST VIRUSES AND OTHER MALICIOUS SOFTWARE. THE AUTHORS AND CONTRIBUTORS DO NOT ASSUME ANY RESPONSIBILITY FOR ANY SECURITY BREACHES OR DATA LOSS THAT MAY OCCUR DUE TO YOUR USE OF THE SOFTWARE.

BY USING THIS SOFTWARE, YOU AGREE TO THE TERMS OF THIS DISCLAIMER AND RELEASE THE AUTHORS AND CONTRIBUTORS FROM ANY LIABILITY ARISING FROM YOUR USE OF THE SOFTWARE.
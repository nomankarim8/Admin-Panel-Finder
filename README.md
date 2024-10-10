# GrabCam v1.1








**Coded by: [The Linux Choice](https://github.com/thelinuxchoice/saycheese)**  
**Modified by: Noob Hackers**

## Description

GrabCam v1.1 is a powerful tool designed to capture photos using the target's device camera by sending them a phishing link. The script uses either Ngrok or Serveo for port forwarding, making it compatible with Termux and other Linux-based environments.

## Features

- Capture target's camera photo through a phishing link.
- Supports both Serveo and Ngrok for port forwarding.
- Automatic IP tracking once the target opens the link.
- Termux compatible (requires storage permissions).
- User-friendly banner display using `lolcat`.


## Requirements

- **Termux (Android):**
  - Run `termux-setup-storage` to grant storage access.
  - Install dependencies: `php`, `wget`, `unzip`.

- **Linux (Desktop/Server):**
  - `php`, `wget`, `unzip`, `ssh` (for Serveo), and `ngrok` (for Ngrok forwarding).

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/noobhackers/grabcam
    cd grabcam
    ```

2. Make the script executable:
    ```bash
    chmod +x grabcam.sh
    ```

3. Run the script:
    ```bash
    ./grabcam.sh
    ```

## Usage

1. Choose the port forwarding option:
   - **Serveo.net**: No additional setup required, uses SSH to forward ports.
   - **Ngrok**: Automatically downloads and sets up Ngrok if not already installed.

2. If prompted, turn on your mobile hotspot to allow link generation.

3. Once the server is running, you will get a direct phishing link. Send this link to the target.

4. When the target opens the link, GrabCam captures the camera feed and stores the photos locally.

5. The target's IP address is also logged and saved in `saved.ip.txt`.

## Credits

- **Original Creator**: [The Linux Choice](https://github.com/thelinuxchoice/saycheese)
- **Reborn by**: Noob Hackers

## License

Please do not copy or use any part of this code without giving due credit to the original authors.

## Disclaimer

This tool is intended for educational purposes only. Use this tool responsibly and ethically. The authors will not be held responsible for any misuse or damage caused by this tool.

# WireGuard-Routed-VPN-Gateway

## Overview
This project sets up a **Raspberry Pi as a VPN Gateway** using Docker and WireGuard. The Raspberry Pi forwards all traffic destined for a specific network (e.g., `192.168.0.0/24`) to a Docker container running a WireGuard VPN client, which securely routes the traffic to a remote network. This setup allows devices on your local network to seamlessly access resources on the remote network.

---

## Setup

### 1. Prepare the WireGuard Configuration
- Upload your WireGuard configuration file to the `docker` folder.
- Rename the file to `SiteToSite.conf`.
- **Important**: Remove any DNS and IPv6 configurations from the file to avoid errors.

### 2. Edit the `hostSetup.sh` Script
- Open the `hostSetup.sh` script in a text editor.
- Update the IP range on **line 22** to match the range of the remote network (e.g., `192.168.0.0/24`).

### 3. Run the Host Setup Script
- Execute the script to configure the Raspberry Pi for routing and forwarding:
  ```bash
  sudo ./hostSetup.sh
  ```

### 4. Build and Run the Docker Container
- Navigate to the `docker` folder and run the following commands:
  ```bash
  docker compose build
  docker compose up -d
  ```

### 5. Configure Static Routes
- Add a static route on your router to forward all traffic for the remote network (e.g., `192.168.0.0/24`) to the Raspberry Pi's IP address.


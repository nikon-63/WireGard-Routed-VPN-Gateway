#!/bin/bash

docker network create \
  --subnet=192.168.200.0/24 \
  vpn_network

NETWORK_ID=$(docker network ls --filter name=vpn_network -q)

if [ -z "$NETWORK_ID" ]; then
  echo "Error: Failed to create the Docker network or retrieve its ID."
  exit 1
fi

DOCKER_BRIDGE="br-$NETWORK_ID"

sudo iptables -t nat -A POSTROUTING -o "$DOCKER_BRIDGE" -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o "$DOCKER_BRIDGE" -j ACCEPT
sudo iptables -A FORWARD -i "$DOCKER_BRIDGE" -o eth0 -j ACCEPT

sudo sysctl -w net.ipv4.ip_forward=1
# Change this IP range to match the range of the remote network
sudo ip route add 192.168.0.0/24 via 192.168.200.2



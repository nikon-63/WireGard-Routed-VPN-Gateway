#!/bin/bash

set -e 

sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv6.conf.all.disable_ipv6=1

iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE

WG_QUICK_NO_IPV6=1 wg-quick up /etc/wireguard/wg0.conf || { echo "WireGuard failed to start"; exit 1; }

tail -f /dev/null

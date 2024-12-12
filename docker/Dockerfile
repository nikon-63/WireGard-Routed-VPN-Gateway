FROM alpine:latest

RUN apk add --no-cache \
    wireguard-tools iproute2 iptables bash openresolv

COPY SiteToSite.conf /etc/wireguard/wg0.conf
COPY start.sh /start.sh
RUN chmod 600 /etc/wireguard/wg0.conf && chmod +x /start.sh

CMD ["/bin/bash", "/start.sh"]

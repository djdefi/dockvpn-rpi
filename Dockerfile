FROM resin/rpi-raspbian:wheezy
VOLUME /etc/openvpn
EXPOSE 443/tcp 1194/udp 8080/tcp
CMD run

## Setup deps
RUN apt-get update && \
    apt-get install --no-install-recommends \
    openvpn iptables socat curl openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./bin /usr/local/sbin

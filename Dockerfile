FROM resin/rpi-raspbian

EXPOSE 9050

RUN apt-get update && \
    apt-get install tor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY torrc /etc/tor/torrc

CMD ["/usr/sbin/tor", "-f", "/etc/tor/torrc"]


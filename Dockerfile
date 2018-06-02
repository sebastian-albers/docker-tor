FROM resin/armhf-alpine

EXPOSE 9050

RUN apk --no-cache --update add tor && \
    cp /etc/tor/torrc.sample /etc/tor/torrc && \
    sed -i'' "1s/^/AvoidDiskWrites 1\n/" /etc/tor/torrc && \
    sed -i'' "1s/^/SocksPort 0.0.0.0:9050\n/" /etc/tor/torrc && \
    sed -i'' "s/^Log notice file/#Log notice file/" /etc/tor/torrc

VOLUME ["/var/lib/tor"]

USER tor

CMD ["/usr/bin/tor"]

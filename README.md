# Tor

![Travis](https://img.shields.io/travis/com/sebastian-albers/docker-tor.svg)
![Docker Build Status](https://img.shields.io/docker/cloud/build/sebastianalbers/tor.svg)
![Docker Automated build](https://img.shields.io/docker/cloud/automated/sebastianalbers/tor.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/sebastianalbers/tor.svg)
![Docker Stars](https://img.shields.io/docker/stars/sebastianalbers/tor.svg)

A Tor Docker image based on Alpine Linux.

It is designed to be used with [sebastianalbers/privoxy](https://hub.docker.com/r/sebastianalbers/privoxy): Privoxy creates an HTTP proxy and tunnels all traffic through Tor.


## Quick set-up
docker-compose file (with description):

Use this docker-compose file to get up and running quickly.

This configuration will publicly expose port 8118.

    version: '2'
    services:
      privoxy:
        image: sebastianalbers/privoxy
        restart: always
        depends_on:
          - tor
        ports:
          - "8118:8118"
      tor:
        image: sebastianalbers/tor
        restart: always


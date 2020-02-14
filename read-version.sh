#!/bin/bash
docker run sebastianalbers/rpi-tor:latest-$1 /usr/bin/tor --version | \
  sed 's/^Tor version \([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*\?$/\1/'

#!/bin/bash

set -eou pipefail

docker run sebastianalbers/tor:latest-$1 /usr/bin/tor --version | \
  sed '/^Tor version/!{q1}; s/^Tor version \([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*\?$/\1/'

#!/bin/bash

set -eou pipefail

docker run --rm sebastianalbers/tor:latest-$1 /usr/bin/tor --version > version.tmp
head -n 1 version.tmp | sed '/^Tor version/!{q1}; s/^Tor version \([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*\?$/\1/'
rm version.tmp

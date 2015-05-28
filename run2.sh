#!/bin/sh

for i in `seq 0 999`
do
  dev="tun:tap$i"
  docker run -d --net=host --device=/dev/net/tun:/dev/net/tun -u 1000 -e INTERFACE=${dev} justincormack/rump-nginx-lua-test
done

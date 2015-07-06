#!/bin/sh

sudo iptables -A POSTROUTING -t mangle  -j CHECKSUM --checksum-fill

for i in `seq 1 10`
do
  docker run -d --cap-add NET_ADMIN -P justincormack/rump-nginx-lua-test
done

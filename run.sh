#!/bin/sh

for i in `seq 1 10`
do
  docker run -d --cap-add NET_ADMIN -P justincormack/rump-nginx-lua-test
done

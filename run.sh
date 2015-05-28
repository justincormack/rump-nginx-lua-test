#!/bin/sh

for i in `seq 5 99`
do
  dev="/dev/tap$i"
  docker run -d --net=host --device=${dev}:/dev/tap justincormack/rump-nginx-lua-test
  sleep 2
done

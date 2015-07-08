#!/bin/sh

die()
{
	echo $1
	exit 1
}

IFACE="eth0"

export FIXED_ADDRESS=`ip addr show dev $IFACE | grep "inet " | awk '{print $2}' | cut -f1 -d/`
export FIXED_MASK=`ip addr show dev $IFACE | grep "inet " | awk '{print $2}' | cut -f2 -d/`
export FIXED_GATEWAY=`ip route get 8.8.8.8 | grep via | cut -f3 -d ' '`

ip addr del $FIXED_ADDRESS/$FIXED_MASK dev $IFACE || die "need cap NET_ADMIN"

rexec nginx -nx -ro fs.img -rw "packet:${IFACE}" -- -c /data/conf/nginx.conf

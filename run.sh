#!/bin/sh

INTERFACE="eth0"

FIXED_GATEWAY=$(ip -4 route list 0/0 | cut -d ' ' -f 3) \
FIXED_ADDDRESS=$(ip -4 addr list ${INTERFACE} |grep inet |cut -d' ' -f6|cut -d/ -f1) \
FIXED_MASK=$(ip -4 addr list ${INTERFACE} |grep inet |cut -d' ' -f6|cut -d/ -f2) \
	rexec nginx fs.img packet:${INTERFACE} -- -c /data/conf/nginx.conf

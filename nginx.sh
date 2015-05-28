#!/bin/sh

rexec nginx fs.img ${INTERFACE} -- -c /data/conf/nginx.conf

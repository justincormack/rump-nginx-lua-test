#!/bin/sh

rexec nginx -ro fs.img -rw ${INTERFACE} -- -c /data/conf/nginx.conf

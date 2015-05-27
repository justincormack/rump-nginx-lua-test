#!/bin/sh

set -e
set -x

tar cf root.tar etc data
rump.tar c -f - /dev > dev.tar
dd if=/dev/zero of=fs.img bs=1k count=10k
rexec rump.newfs fs.img -- /dev/rblock0
cat dev.tar | rexec rump.dd fs.img -- of=dev.tar
cat root.tar | rexec rump.dd fs.img -- of=root.tar
rexec rump.tar fs.img -- xf dev.tar
rexec rump.tar fs.img -- xf root.tar
rexec rump.rm fs.img -- dev.tar root.tar
rexec rump.mkdir fs.img -- /tmp

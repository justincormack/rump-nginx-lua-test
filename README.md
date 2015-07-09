Test repo for a userspace rump kernel unikernel with docker. This runs nginx with embedded Lua module.

You can run as a normal docker container with:
```
docker run -d --cap-add NET_ADMIN -P justincormack/rump-nginx-lua-test
```

It needs net\_admin to remove the IP address from the Linux interface and
open a raw socket.

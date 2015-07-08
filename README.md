Test repo for a userspace rump kernel unikernel with docker. This runs nginx with embedded Lua module.

You must do
```
sudo iptables -A POSTROUTING -t mangle  -j CHECKSUM --checksum-fill
```

to use this, as Linux is over-eager on checksum offload with packet sockets
on veth devices even if disabled on the interface. I will fix this by
teaching the unikernel about offload.

You can run as a normal docker container with:
```
docker run -d --cap-add NET_ADMIN -P justincormack/rump-nginx-lua-test
```

It needs net\_admin to remove the IP address from the Linux interface and
open a raw socket.

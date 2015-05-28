# Simple example with rump-nginx-lua

FROM justincormack/rump-nginx-lua2

MAINTAINER Justin Cormack

COPY . /usr/src/rump-nginx-lua-test

WORKDIR /usr/src/rump-nginx-lua-test

RUN ./build.sh

CMD ["./run.sh"]

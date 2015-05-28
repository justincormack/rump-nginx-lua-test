# Simple example with rump-nginx-lua

FROM justincormack/rump-nginx-lua

MAINTAINER Justin Cormack

COPY . /usr/src/rump-nginx-lua-test

WORKDIR /usr/src/rump-nginx-lua-test

RUN ./build.sh

ENV RUMP_VERBOSE=1

CMD ["./nginx.sh"]

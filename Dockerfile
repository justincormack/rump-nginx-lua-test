# Simple example with rump-nginx-lua

FROM justincormack/rump-nginx-lua

MAINTAINER Justin Cormack

COPY . /usr/src/rump-nginx-lua-test

WORKDIR /usr/src/rump-nginx-lua-test

ENV SUDO_UID=1000

RUN ./build.sh

ENV RUMP_VERBOSE=1

EXPOSE 80

CMD ["rexec", "nginx", "-nx", "-ro", "fs.img", "-rw", "docker:eth0", "--", "-c", "/data/conf/nginx.conf"]

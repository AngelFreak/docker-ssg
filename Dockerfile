FROM alpine:3.8 AS build
LABEL maintainer="AngelFreak <angelfreak@tsrv.pw>"

ENV SITE=test
ENV URL=https://www

ARG SSG_VERSION="5"
ARG LOWDOWN_VERSION="0.7.4"
ARG LOWDOWN_CHECKSUM="c0de30ee5b8fc990e5a629ce4c71a929654fb73c102578f1a1c6d1856bc599ce1bad156ff9b693ea199304c9688b917211911e94f95c0497696b677174f4c2a3"

ADD https://kristaps.bsd.lv/lowdown/snapshots/lowdown.tar.gz /tmp

RUN [ "$LOWDOWN_CHECKSUM" = "$(sha512sum /tmp/lowdown.tar.gz | awk '{print $1}')" ] && \
    tar -C /tmp -xf /tmp/lowdown.tar.gz && \
    apk --update add --no-cache wget build-base bsd-compat-headers && \
    apk upgrade && \
    apk add --no-cache ca-certificates && \
    cd /tmp/lowdown-$LOWDOWN_VERSION && \
    ./configure && \
    make install

RUN mkdir -p /rootfs/bin /rootfs/src /rootfs/dst /rootfs/usr/local/bin && \
    wget -O /rootfs/bin/ssg$SSG_VERSION https://www.romanzolotarev.com/bin/ssg$SSG_VERSION && \
    chmod +x /rootfs/bin/ssg$SSG_VERSION && \
    cp /tmp/lowdown-$LOWDOWN_VERSION/lowdown /rootfs/usr/local/bin/

FROM alpine:3.8

COPY --from=build /rootfs /
COPY run.sh /run.sh

VOLUME /src
VOLUME /dst

CMD ["/run.sh"]

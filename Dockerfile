# Alpine is quite small right?
FROM alpine:3.8
# Yes thats me
LABEL maintainer="AngelFreak <angelfreak@tsrv.pw>"

# Declare some boring stuff..
ENV SITE=test
ENV URL=https://www

# Copy run script
COPY ./run.sh /run.sh

# Add the required packages
RUN apk add --update wget build-base bsd-compat-headers \
    && apk upgrade \
    && apk add --no-cache ca-certificates

ADD https://kristaps.bsd.lv/lowdown/snapshots/lowdown.tar.gz /tmp
RUN tar -xf /tmp/lowdown.tar.gz -C /tmp \
    && cd /tmp/lowdown* \
    && ./configure \
    && make install

# Prepare a envoroment for ssg
RUN mkdir -p bin

# Get ssg from the source!
RUN wget -O bin/ssg3 https://www.romanzolotarev.com/bin/ssg3
# Well make it executable...
RUN chmod +x bin/ssg3

# Create the proper folders
RUN mkdir /src /dst

# Makes the folders accessable as volumes
VOLUME /src
VOLUME /dst

# Go go go!!!
CMD ["/run.sh"]

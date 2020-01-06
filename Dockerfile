FROM ubuntu:18.04

ENV VERSION=18.04 \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Rome \
    SERVICE=ubuntu

COPY bin/tini-static-amd64 /

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install --no-install-recommends -y tzdata inetutils-ping netcat && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /tini-static-amd64 && \
    ln -s /tini-static-amd64 /tini

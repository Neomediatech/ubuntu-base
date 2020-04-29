FROM ubuntu:18.04

ENV VERSION=18.04 \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Rome \
    OS=ubuntu \
    LANG=it_IT.utf8

ARG UPDATE=18.04-u202004292000

COPY bin/tini-static-amd64 /

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install --no-install-recommends -y tzdata locales inetutils-ping netcat && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /tini-static-amd64 && \
    ln -s /tini-static-amd64 /tini && \
    localedef -i it_IT -c -f UTF-8 -A /usr/share/locale/locale.alias it_IT.UTF-8

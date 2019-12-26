FROM ubuntu:18.04

ENV VERSION=18.04 \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Rome \
    SERVICE=ubuntu

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y tzdata && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

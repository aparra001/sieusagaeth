FROM ubuntu:16.04

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="ethminer in Docker. Supports CPU & GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl \
    && curl -L -O https://github.com/ethereum-mining/ethminer/releases/download/v0.11.0/ethminer-0.11.0-Linux.tar.gz \
    && tar -xvf ethminer-0.11.0-Linux.tar.gz \
    && rm ethminer-0.11.0-Linux.tar.gz \
    && mv bin/ethminer /usr/local/bin/ethminer \
    && chmod a+x /usr/local/bin/ethminer \
    && rm -r bin/ \
    && apt-get -y remove ca-certificates curl \
    && rm -r /var/lib/apt/lists/*

ENTRYPOINT ["ethminer"]

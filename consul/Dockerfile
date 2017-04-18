#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /consul
#
#    to help improve or steer this or other code I publish
#
#   
#

# busybox wget doesn't support SSL, no curl available :-(
#FROM busybox:latest
FROM alpine:latest
MAINTAINER Hari Sekhon ( )

#ARG CONSUL_VERSION=0.1.0
#ARG CONSUL_VERSION=0.2.1
#ARG CONSUL_VERSION=0.3.1
#ARG CONSUL_VERSION=0.4.1
#ARG CONSUL_VERSION=0.5.2
#ARG CONSUL_VERSION=0.6.4
ARG CONSUL_VERSION=0.7.1

ENV PATH $PATH:/

LABEL Description="HashiCorp's Consul minimal" \
      "Consul Version"="$CONSUL_VERSION"

# faster, cached
#COPY consul /

#ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip

RUN \
    apk add --no-cache wget unzip ca-certificates && \
    wget -t 100 --retry-connrefused -O "consul_${CONSUL_VERSION}_linux_amd64.zip" "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    unzip "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    rm -fv "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    apk del wget unzip ca-certificates

#COPY entrypoint.sh /

EXPOSE 8400 8500 8600

#ENTRYPOINT ["/entrypoint.sh"]
ENTRYPOINT ["/consul"]

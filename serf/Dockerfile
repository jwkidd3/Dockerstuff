#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /serf
#
#    to help improve or steer this or other code I publish
#
#   
#

# busybox wget doesn't support SSL, no curl available :-(
#FROM busybox:latest
FROM alpine:latest
MAINTAINER Hari Sekhon ( )

#ARG SERF_VERSION=0.1.0
#ARG SERF_VERSION=0.2.1
#ARG SERF_VERSION=0.3.0
#ARG SERF_VERSION=0.4.5
#ARG SERF_VERSION=0.5.0
#ARG SERF_VERSION=0.6.4
ARG SERF_VERSION=0.7.0

ENV PATH $PATH:/

LABEL Description="HashiCorp's Serf minimal" \
      "Serf Version"="$SERF_VERSION"

#COPY serf /

#ADD https://releases.hashicorp.com/serf/${SERF_VERSION}/serf_${SERF_VERSION}_linux_amd64.zip /

WORKDIR /

RUN \
    apk add --no-cache wget unzip ca-certificates && \
    wget -t 100 --retry-connrefused -O "serf_${SERF_VERSION}_linux_amd64.zip" "https://releases.hashicorp.com/serf/${SERF_VERSION}/serf_${SERF_VERSION}_linux_amd64.zip" && \
    unzip "serf_${SERF_VERSION}_linux_amd64.zip" && \
    rm -fv "serf_${SERF_VERSION}_linux_amd64.zip" && \
    apk del wget unzip ca-certificates

EXPOSE 7946 7373

#COPY entrypoint.sh /

ENTRYPOINT ["/serf"]
#ENTRYPOINT ["/entrypoint.sh"]

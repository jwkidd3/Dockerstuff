#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /kafka
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM alpine:latest
MAINTAINER Hari Sekhon ( )

#ARG SCALA_VERSION=2.10
ARG SCALA_VERSION=2.11
#ARG KAFKA_VERSION=0.8.2.2
#ARG KAFKA_VERSION=0.9.0.1
ARG KAFKA_VERSION=0.10.2.0
# 0.10 fails to come up
#ARG KAFKA_VERSION=0.10.0.0

ENV ADVERTISED_HOSTNAME=127.0.0.1

ENV PATH $PATH:/kafka/bin

LABEL Description="Apache Kafka by LinkedIn" \
      "Scala Version"="$SCALA_VERSION" \
      "Kafka Version"="$KAFKA_VERSION"

RUN \
    apk add --no-cache bash perl openjdk8-jre-base wget tar && \
    wget -t 100 --retry-connrefused -O "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" "https://www.apache.org/dyn/closer.cgi?filename=/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz&action=download" && \
    tar zxf "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    rm -fv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    ln -sv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}" kafka && \
    # attempting to remove tar causes unmet dependency breakage
    apk del wget
RUN rm -f /kafka/config/server.properties
ADD server.properties /kafka/config/server.properties
COPY entrypoint.sh /

EXPOSE 2181 9092

CMD /entrypoint.sh

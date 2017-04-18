#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /ubuntu-java
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM ubuntu:latest
MAINTAINER Hari Sekhon ( )

LABEL Description="Java + Ubuntu (OpenJDK)"

ARG JAVA_VERSION=8
ARG JAVA_RELEASE=JDK

ENV JAVA_HOME=/usr

RUN apt-get update && \
    pkg="openjdk-$JAVA_VERSION"; \
    if [ "$JAVA_RELEASE" = "JDK" ]; then \
        pkg="$pkg-jdk-headless"; \
    else \
        pkg="$pkg-jre-headless"; \
    fi; \
    apt-get install -y --no-install-recommends "$pkg" && \
    apt-get clean

COPY profile.d/java.sh /etc/profile.d/

CMD /bin/bash

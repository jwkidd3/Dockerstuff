#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /debian-java
#
#    to help improve or steer this or other code I publish
#
#   
#

# currently on Jessie which doesn't have OpenJDK 8 yet
#FROM debian:latest
FROM debian:stretch
MAINTAINER Hari Sekhon ( )

LABEL Description="Java + Debian (OpenJDK)"

ARG JAVA_VERSION=8
ARG JAVA_RELEASE=JRE

ENV JAVA_HOME=/usr

RUN apt-get update && \
    pkg="openjdk-$JAVA_VERSION"; \
    if [ "$JAVA_RELEASE" = "JDK" ]; then \
        pkg="$pkg-jdk"; \
    else \
        pkg="$pkg-jre-headless"; \
    fi; \
    apt-get install -y --no-install-recommends "$pkg" && \
    apt-get clean

COPY profile.d/java.sh /etc/profile.d/

CMD /bin/bash

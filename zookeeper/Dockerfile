#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#  https://github.com/harisekhon/Dockerfiles/zookeeper
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help improve or steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

FROM alpine:latest
MAINTAINER Hari Sekhon (https://www.linkedin.com/in/harisekhon)

#ARG ZOOKEEPER_VERSION=3.3.6
ARG ZOOKEEPER_VERSION=3.4.8
ARG TAR=zookeeper-${ZOOKEEPER_VERSION}.tar.gz

ENV PATH $PATH:/zookeeper/bin

LABEL Description="ZooKeeper" \
      "ZooKeeper Version"="$ZOOKEEPER_VERSION"

WORKDIR /

RUN \
    apk add --no-cache bash openjdk8-jre-base wget tar && \
    wget -t 100 --retry-connrefused -O "$TAR" "http://www.apache.org/dyn/closer.lua?filename=zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${TAR}&action=download" && \
    tar zxf "${TAR}" && \
    rm -fv "${TAR}" && \
    ln -sv /zookeeper-${ZOOKEEPER_VERSION} /zookeeper && \
    cp -av /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg && \
    { rm -rf zookeeper/{src,docs}; : ; } && \
    apk del wget tar

EXPOSE 2181 3181 4181

COPY entrypoint.sh /

CMD /entrypoint.sh
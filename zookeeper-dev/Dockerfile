#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /zookeeper-dev
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM harisekhon/alpine-github:latest
MAINTAINER Hari Sekhon ( )

#ARG ZOOKEEPER_VERSION=3.3.6
ARG ZOOKEEPER_VERSION=3.4.8
ARG TAR="zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

ENV PATH $PATH:/zookeeper/bin

LABEL Description="ZooKeeper Dev" \
      "ZooKeeper Version"="$ZOOKEEPER_VERSION"

WORKDIR /

RUN \
    apk add --no-cache wget && \
    wget -t 100 --retry-connrefused -O "$TAR" "http://www.apache.org/dyn/closer.lua?filename=zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${TAR}&action=download" && \
    tar zxf "${TAR}" && \
    rm -fv "${TAR}" && \
    ln -sv /zookeeper-${ZOOKEEPER_VERSION} /zookeeper && \
    cp -av /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg && \
    { rm -rf zookeeper/{src,docs}; : ; } && \
    apk del wget

EXPOSE 2181 3181 4181

COPY entrypoint.sh /

CMD /entrypoint.sh

#
#  Author: Hari Sekhon
#  Date: 2016-07-22 14:37:57 +0100 (Fri, 22 Jul 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /centos-java
#
#    to help steer this or other code I publish
#
#   
#

FROM harisekhon/centos-java:latest
MAINTAINER Hari Sekhon ( )

ARG TEAMCITY_VERSION=10.0
ARG TAR="TeamCity-$TEAMCITY_VERSION.tar.gz"

ENV PATH $PATH:/opt/TeamCity/bin

LABEL Description="TeamCity", \
      "TeamCity Version"="$TEAMCITY_VERSION"

WORKDIR /opt

RUN \
    yum install -y tar && \
    curl -L "https://download.jetbrains.com/teamcity/$TAR" > "$TAR" && \
    tar zxf "$TAR" && \
    yum remove -y tar && \
    yum autoremove -y && \
    yum clean all

EXPOSE 8111

CMD teamcity-server.sh start

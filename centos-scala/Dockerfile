#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /centos-scala
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM harisekhon/centos-java:jdk8
MAINTAINER Hari Sekhon ( )

ARG SCALA_VERSION=2.10.6

LABEL Description="Scala + CentOS (+OpenJDK)"

RUN rpm -ivh http://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.rpm

CMD /bin/bash

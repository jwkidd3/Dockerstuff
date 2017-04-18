#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /spark-apps
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM harisekhon/centos-scala:2.11-jdk8
MAINTAINER Hari Sekhon ( )

LABEL Description="Spark Scala Apps (Spark => Elasticsearch etc)"

# unit test for lib-java fails when sh is found in /usr/bin/sh as /usr/bin is earlier in the path than /bin
ENV PATH /bin:$PATH:/github/spark-apps

RUN mkdir -vp /github

WORKDIR /github

RUN \
    x=spark-apps; \
    yum install -y make git maven && \
    curl -L https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
    yum install -y --nogpgcheck sbt && \
    git clone https://github.com/harisekhon/$x /github/$x && \
    cd /github/$x && \
    make build clean && \
    yum autoremove -y && \
    yum clean all

WORKDIR /github/spark-apps

CMD /bin/bash

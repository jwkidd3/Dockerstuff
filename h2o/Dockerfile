#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /h2o
#
#    to help improve or steer this or other code I publish
#
#   
#

#FROM harisekhon/centos-java:jre7
# > 100MB smaller than centos
FROM harisekhon/debian-java:jre7
MAINTAINER Hari Sekhon ( )

#ARG H2O_VERSION=2.6.1.5
#ARG H2O_VERSION=3.8.0.4
#ARG H2O_VERSION=3.8.2.3
ARG H2O_VERSION=3.10.0.3

ENV PATH $PATH:/h2o/bin

LABEL Description="H2O" \
      "0xData H2O Version"="$H2O_VERSION"

#COPY h2o-$H2O_VERSION /h2o

WORKDIR /

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends wget unzip && \
    # 2.6.1.5
    #wget -t 100 --retry-connrefused http://h2o-release.s3.amazonaws.com/h2o/rel-lambert/5/h2o-${H2O_VERSION}.zip && \
    # 3.x url has changed
    wget -t 100 --retry-connrefused http://download.h2o.ai/versions/h2o-${H2O_VERSION}.zip && \
    unzip h2o-${H2O_VERSION}.zip && \
    rm h2o-${H2O_VERSION}.zip && \
    ln -s h2o-${H2O_VERSION} h2o && \
    apt-get purge -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean

EXPOSE 54321

CMD java -jar /h2o/h2o.jar

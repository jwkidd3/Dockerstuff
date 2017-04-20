#
#  Author: Hari Sekhon
#  Date: 2016-04-24 21:18:57 +0100 (Sun, 24 Apr 2016)
#
#  vim:ts=4:sts=4:sw=4:et

FROM harisekhon/centos-java:latest
MAINTAINER Hari Sekhon ( )

ARG HADOOP_VERSION=2.7.2

ARG TAR=hadoop-$HADOOP_VERSION.tar.gz

ENV PATH $PATH:/hadoop/bin

LABEL Description="Hadoop Dev", \
      "Hadoop Version"="$HADOOP_VERSION"

WORKDIR /

RUN \
    yum install -y openssh-server openssh-clients wget tar which hostname && \
    wget -t 100 --retry-connrefused -O "$TAR" "http://www.apache.org/dyn/closer.lua?filename=hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-$HADOOP_VERSION.tar.gz&action=download" && \
    tar zxf "$TAR" && \
    ln -sv hadoop-$HADOOP_VERSION hadoop && \
    rm -fv "$TAR" && \
    { rm -rf hadoop/share/doc; : ; } && \
    /hadoop/bin/hdfs namenode -format
RUN wget -t 100 --retry-connrefused -O "$TAR" "http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz" && tar xvf "$TAR" && ln -sv ./spark-2.1.0-bin-hadoop2.7 ./spark
RUN rm -fv spark-2.1.0-bin-hadoop2.7.tgz
#RUN yum remove -y wget tar
RUN yum autoremove -y
RUN yum install -y hostname
RUN yum clean all

COPY entrypoint.sh /
COPY conf/core-site.xml /hadoop/etc/hadoop/
COPY conf/hdfs-site.xml /hadoop/etc/hadoop/
COPY conf/yarn-site.xml /hadoop/etc/hadoop/
COPY conf/mapred-site.xml /hadoop/etc/hadoop/
COPY profile.d/hadoop.sh /etc/profile.d/

EXPOSE 8020 8042 8088 9000 10020 19888 50010 50020 50070 50075 50090

CMD "/entrypoint.sh"

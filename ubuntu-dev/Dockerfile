#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /ubuntu-dev
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM harisekhon/ubuntu-java:jdk8
MAINTAINER Hari Sekhon ( )

LABEL Description="Ubuntu Dev Build"

ENV JAVA_HOME=/usr
ENV JYTHON_HOME=/opt/jython
ENV PATH $PATH:$JYTHON_HOME/bin

RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
                       build-essential \
                       curl \
                       dstat \
                       expect \
                       ethtool \
                       git \
                       gradle \
                       groovy \
                       libdbd-mysql-perl \
                       libev4 \
                       libexpat1-dev \
                       libkrb5-dev \
                       libmysqlclient-dev \
                       libsasl2-dev \
                       libsnappy-dev \
                       libssl-dev \
                       make \
                       maven \
                       net-tools \
                       python-dev \
                       python-pip \
                       python-setuptools \
                       ruby \
                       ruby-dev \
                       scala \
                       sysstat \
                       unzip \
                       vim \
                       wget \
                       zip && \
    # for sbt https repo
    apt-get install -y --no-install-recommends apt-transport-https && \
    echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 && \
    apt-get update && \
    apt-get install -y --no-install-recommends sbt && \
    # for Maven 3
    #echo deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main >> /etc/apt/sources.list && \
    #apt-get update && \
    #apt-get install -y maven && \
    apt-get autoremove -y && \
    apt-get clean

# Jython
RUN \
    wget https://raw.githubusercontent.com/HariSekhon/pytools/master/jython_install.sh && \
    wget https://raw.githubusercontent.com/HariSekhon/pytools/master/jython_autoinstall.exp && \
    sh jython_install.sh && \
    rm -f jython_install.sh jython_autoinstall.exp

CMD /bin/bash

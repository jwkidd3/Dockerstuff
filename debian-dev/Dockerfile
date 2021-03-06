#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /debian-dev
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM harisekhon/debian-java:jdk8
MAINTAINER Hari Sekhon ( )

LABEL Description="Debian Dev Build"

ENV GRADLE_HOME=/opt/gradle
ENV JYTHON_HOME=/opt/jython
ENV PATH $PATH:$GRADLE_HOME/bin:$JYTHON_HOME/bin

RUN apt-get update && \
    apt-get upgrade -y && \
    # --no-install-recommends breaks sbt download due to missing gnupg, even adding gnupg + gnupg1 + gnupg2 manually it still breaks on download manager when trying to get sbt
    apt-get install -y \
                       build-essential \
                       curl \
                       dstat \
                       ethtool \
                       expect \
                       git \
                       #gradle \
                       groovy2 \
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
                       # TODO: Scala 2.9, put newer scala on here
                       scala \
                       sysstat \
                       unzip \
                       vim \
                       wget \
                       zip \
                       && \
    # for sbt https repo
    apt-get install -y \
                       apt-transport-https \
                       #gnupg \
                       #gnupg1 \
                       #gnupg2 \
                       && \
    echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 && \
    apt-get update && \
    apt-get install -y sbt && \
    # for Maven 3
    #echo deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main >> /etc/apt/sources.list && \
    #apt-get update && \
    #apt-get install -y maven && \
    apt-get autoremove -y && \
    apt-get clean

# Gradle in Debian is old 1.5 :-(
RUN \
    wget https://raw.githubusercontent.com/HariSekhon/bash-tools/master/install_gradle.sh && \
    sh install_gradle.sh && \
    rm -f install_gradle.sh

# Jython
RUN \
    wget https://raw.githubusercontent.com/HariSekhon/pytools/master/jython_install.sh && \
    wget https://raw.githubusercontent.com/HariSekhon/pytools/master/jython_autoinstall.exp && \
    sh jython_install.sh && \
    rm -f jython_install.sh jython_autoinstall.exp

CMD /bin/bash

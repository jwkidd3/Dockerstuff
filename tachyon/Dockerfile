#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /tachyon
#
#    to help improve or steer this or other code I publish
#
#   
#

#FROM harisekhon/centos-java:jre7
# > 100MB smaller than centos
FROM harisekhon/debian-java:jre7
MAINTAINER Hari Sekhon ( )

#ARG TACHYON_VERSION=0.7.1
ARG TACHYON_VERSION=0.8.2

ENV PATH $PATH:/tachyon/bin

LABEL Description="Tachyon from BDAS" \
      "Tachyon Version"="$TACHYON_VERSION"

# use dev build it's quicker and cached
#RUN yum install -y java-1.7.0-openjdk && yum clean all

#COPY tachyon-$TACHYON_VERSION /tachyon

WORKDIR /

#RUN yum install -y sudo openssh-server && yum clean all
RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo openssh-server wget tar && \
    wget -t 100 --retry-connrefused -O "tachyon-${TACHYON_VERSION}-bin.tar.gz" "http://tachyon-project.org/downloads/files/${TACHYON_VERSION}/tachyon-${TACHYON_VERSION}-bin.tar.gz" && \
    tar zxf "tachyon-${TACHYON_VERSION}-bin.tar.gz" && \
    ln -sv "tachyon-${TACHYON_VERSION}" tachyon && \
    rm -fv "tachyon-${TACHYON_VERSION}-bin.tar.gz" && \
    { rm -fr tachyon/{docs,examples}; : ; } && \
    mkdir /var/run/sshd && chmod 0755 /var/run/sshd && \
    cp -v /tachyon/conf/tachyon-env.sh.template /tachyon/conf/tachyon-env.sh && \
    tachyon format && \
    # attempting to remove tar causes unmet dependency breakage
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean

COPY entrypoint.sh /

EXPOSE 19999 30000

ENTRYPOINT ["/entrypoint.sh"]
#CMD /usr/sbin/sshd; sleep 1; tachyon-start.sh local; sleep 2; cat /tachyon/logs/*; tail -f /tachyon/logs/*

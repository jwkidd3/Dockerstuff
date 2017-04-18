#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /riak
#
#    to help improve or steer this or other code I publish
#
#   
#

# can't base off official Riak as it's missing deps to run the tools
#FROM riak
FROM centos:latest
MAINTAINER Hari Sekhon ( )

#ARG RIAK_VERSION=1.4.9
# LTS release
#ARG RIAK_VERSION=2.0.6
ARG RIAK_VERSION=2.1.4

LABEL Description="Riak" \
      "Riak Version"="$RIAK_VERSION"

#RUN OS=el DIST=6 curl "https://packagecloud.io/install/repositories/basho/riak/config_file.repo?os=${OS}&dist=${DIST}&name=basho_repo" > /etc/yum.repos.d/basho.repo && \

# Riak 1.x
#RUN yum install -y http://yum.basho.com/gpg/basho-release-6-1.noarch.rpm && \
#    yum install -y riak-$RIAK_VERSION && \
#    yum autoremove -y && \
#    yum clean all
# Riak 2.x
RUN yum install -y "http://s3.amazonaws.com/downloads.basho.com/riak/$(sed 's/.[[:digit:]]*$//' <<< "$RIAK_VERSION")/$RIAK_VERSION/rhel/6/riak-$RIAK_VERSION-1.el6.x86_64.rpm" && \
    yum autoremove -y && \
    yum clean all

# make HTTP listen on 0.0.0.0 not 127.0.0.1
# Riak 1.x
COPY conf/app.config /etc/riak/
# Riak 2.x
COPY conf/riak.conf /etc/riak/

EXPOSE 8087 8098

CMD su - riak -c '/usr/sbin/riak start'; sleep 5; cat /var/log/riak/*; tail -f /var/log/riak/*

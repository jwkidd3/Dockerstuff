#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /nagios-plugins
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM debian:latest
MAINTAINER Hari Sekhon ( )

LABEL Description="Advanced Nagios Plugins Collection (on Debian)"

ENV PATH $PATH:/github/nagios-plugins

RUN mkdir -v /github

WORKDIR /github

# drops in to /bin/sh pushd not available, could bash -c but explicit paths are good enough
RUN \
    x=nagios-plugins; \
    apt-get update && \
    apt-get install -y git make && \
    git clone https://github.com/harisekhon/$x /github/$x && \
    cd /github/$x && \
    make build zookeeper clean && \
    make apt-packages-remove && \
    tests/help.sh || \
    { for x in /home/travis/.cpanm/work/*/build.log; do echo "uploading $x"; curl -sT "$x" transfer.sh || :; curl -sT "$x" chunk.io || :; done; exit 1; }

WORKDIR /github/nagios-plugins

# trying to do -exec basename {} \; results in only the jython files being printed
CMD /bin/bash -c "find /github/nagios-plugins -maxdepth 2 -type f -iname '[A-Za-z]*.pl' -o -iname '[A-Za-z]*.py' | grep -iv makefile | xargs -n1 basename | sort"

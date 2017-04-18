#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /jython
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM openjdk:jre-alpine
MAINTAINER Hari Sekhon ( )

ARG JYTHON_VERSION=2.7.0
ARG JYTHON_HOME=/opt/jython-$JYTHON_VERSION

LABEL Description="Jython $JYTHON_VERSION on Alpine + OpenJDK, minimal container"

RUN \
    apk add --no-cache bash wget && \
    wget -cO jython-installer.jar "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/$JYTHON_VERSION/jython-installer-$JYTHON_VERSION.jar" && \
    java -jar jython-installer.jar -s -t standard -d "$JYTHON_HOME" && \
    rm -fr "$JYTHON_HOME"/{Docs,Demo,tests} && \
    rm -f jython-installer.jar && \
    ln -sfv "$JYTHON_HOME/bin/"* /usr/local/bin/ && \
    apk del wget

#CMD ["jython"]
ENTRYPOINT ["jython"]

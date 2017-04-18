#
#  Author: Hari Sekhon
#  Date: 2016-12-23 10:03:26 +0000 (Fri, 23 Dec 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#   /rabbitmq-cluster
#
#    to help improve or steer this or other code I publish
#
#   
#

FROM rabbitmq:3.6
MAINTAINER Hari Sekhon ( )

#ARG RABBITMQ_VERSION=3.4
#ARG RABBITMQ_VERSION=3.5
ARG RABBITMQ_VERSION=3.6

LABEL Description="RabbitMQ Cluster" \
      "RabbitMQ Version"="$RABBITMQ_VERSION"

COPY entrypoint.sh /
COPY rabbitmq-cluster /usr/bin

EXPOSE 15672

ENTRYPOINT ["/entrypoint.sh"]

CMD ["rabbitmq-cluster"]

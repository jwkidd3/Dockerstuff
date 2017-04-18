#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2016-07-14 16:35:56 +0100 (Thu, 14 Jul 2016)
#
#   /kafka
#
#   
#
#    to help steer this or other code I publish
#
#   
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

ADVERTISED_HOSTNAME="${ADVERTISED_HOSTNAME:-127.0.0.1}"

zookeeper-server-start.sh /kafka/config/zookeeper.properties &
echo "*** waiting for 10 secs to give ZooKeeper time to start up"
sleep 10
echo "# ============================================================================ #"
echo "                         S t a r t i n g   K a f k a"
echo "# ============================================================================ #"
echo $ADVERTISED_HOSTNAME
#perl -pi.orig -e "s/\s*#?\s*listeners.*/listeners=PLAINTEXT://${ADVERTISED_HOSTNAME}:9092/" "/kafka/config/server.properties" && \
kafka-server-start.sh /kafka/config/server.properties

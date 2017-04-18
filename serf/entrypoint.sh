#!/bin/bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2016-01-26 22:51:25 +0000 (Tue, 26 Jan 2016)
#
#   /serf
#
#   
#
#   
#
#   
#

# NOT USED

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

# busybox's egrep and sed ERE are broken, don't recognize \. - doing something a bit more basic but it works
ip="$(ifconfig | grep -m1 'inet addr:' | sed 's/.*inet addr://;s/ .*$//')"

# none of this seems necessary with serf
args=""
if [ $# -eq 0 -o "${1:-}" = "agent" ]; then
    args="-bind $ip -rpc-addr $ip:7373"
fi

exec /serf $@ $args

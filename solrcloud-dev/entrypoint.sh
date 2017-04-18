#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2016-04-24 21:29:46 +0100 (Sun, 24 Apr 2016)
#
#   /solrcloud-dev
#
#   
#
#   
#
#   
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export JAVA_HOME="${JAVA_HOME:-/usr}"

export SOLR_HOME="/solr"

# solr -e cloud fails if not called from $SOLR_HOME
cd "$SOLR_HOME"

if [ $# -gt 0 ]; then
    exec $@
else
    # exits with 141 for pipefail breaking yes stdout
    set +o pipefail
    solr -e cloud -noprompt
    if ls -d "$SOLR_HOME"-4* &>/dev/null; then
        tail -f "$SOLR_HOME/"node*/logs/*
    else
        tail -f "$SOLR_HOME/example/cloud/"node*/logs/*
    fi
fi

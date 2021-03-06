#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2016-05-24 13:51:14 +0100 (Tue, 24 May 2016)
#
#   
#
#   
#
#    to help steer this or other code I publish
#
#   
#

# Because DockerHub is awfully slow to get round to doing builds

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$srcdir"

selection="${1:-}"

tags=$(git tag)

for tag in $tags; do
    tag_base="${tag%%-[[:digit:]]*}"
    tag_version="${tag##*[[:alpha:]]-}"
    [ -n "$selection" -a "$selection" != "$tag_base" ] && continue
    echo "checking out tag $tag"
    git checkout "$tag"
    find . -maxdepth 1 -type d |
    while read directory; do
        directory="${directory##*/}"
        if [ "$directory" = "$tag_base" ]; then
            pushd "$directory" &>/dev/null
            docker build -t "harisekhon/$tag_base:$tag_version" .
            popd &>/dev/null
        fi
    done
done

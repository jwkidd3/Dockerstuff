#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2016-07-25 18:14:49 +0100 (Mon, 25 Jul 2016)
#
#  https://github.com/harisekhon/bash-tools
#
#   
#
#    to help improve or steer this or other code I publish
#
#   
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$srcdir/.."

. bash-tools/utils.sh

section "Dockerfiles checks"

tests/check_repo_names.sh

tests/check_docker-compose_images.sh

tests/pytools_checks.sh

echo

bash-tools/all.sh

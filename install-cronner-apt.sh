#!/bin/sh

set -e

apt-get update && apt-get install -y curl iproute2 gzip tar

curl -f https://raw.githubusercontent.com/managedbyq/cronner-utils/master/install-cronner-common.sh | sh

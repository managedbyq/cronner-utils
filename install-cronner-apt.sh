#!/bin/sh

set -e

apt-get update && apt-get install -y iproute2 gzip tar wget

cd /tmp
wget https://raw.githubusercontent.com/managedbyq/cronner-utils/master/install-cronner-common.sh
chmod +x install-cronner-common.sh
./install-cronner-common.sh

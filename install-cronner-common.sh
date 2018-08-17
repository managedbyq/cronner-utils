#!/bin/sh

set -e

cd /tmp

curl -f -o cronner-linux-amd64-v1.0.0.tar.gz https://github.com/theckman/cronner/releases/download/v1.0.0/cronner-linux-amd64-v1.0.0.tar.gz
export CHECKSUM=`openssl sha256 cronner-linux-amd64-v1.0.0.tar.gz | awk '{print $2}'`
[ $CHECKSUM = b2e38b754d0c04c748e1548fa8d138616174dc67633a9848c7f422ddeb94cf14 ]
gunzip cronner-linux-amd64-v1.0.0.tar.gz
tar -xvf cronner-linux-amd64-v1.0.0.tar
mv cronner-linux-amd64-v1.0.0/cronner /usr/local/bin/cronner
rm -rf /tmp/cronner*

curl -o cronner-wrap https://raw.githubusercontent.com/managedbyq/cronner-utils/master/cronner-wrap
chmod +x cronner-wrap
mv cronner-wrap /usr/local/bin/cronner-wrap

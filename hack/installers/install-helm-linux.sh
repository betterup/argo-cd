#!/bin/bash
set -eux -o pipefail

. $(dirname $0)/../tool-versions.sh

# export TARGET_FILE=helm-v${helm3_version}-linux-${ARCHITECTURE}.tar.gz

# [ -e $DOWNLOADS/${TARGET_FILE} ] || curl -sLf --retry 3 -o $DOWNLOADS/${TARGET_FILE} https://get.helm.sh/helm-v${helm3_version}-linux-$ARCHITECTURE.tar.gz
# $(dirname $0)/compare-chksum.sh
# mkdir -p /tmp/helm && tar -C /tmp/helm -xf $DOWNLOADS/${TARGET_FILE}
# sudo install -m 0755 /tmp/helm/linux-$ARCHITECTURE/helm $BIN/helm

mkdir -p /tmp/helm && cd /tmp/helm
curl -LO https://get.helm.sh/helm-v3.14.3-linux-amd64.tar.gz
tar zxf helm-v3.14.3-linux-amd64.tar.gz
cd helm-v3.14.3-linux-amd64
chmod +x helm
cp helm $BIN/helm
helm version --client

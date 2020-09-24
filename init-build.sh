#!/usr/bin/env sh
CURRENT_DIR="$(cd "$( dirname "$0" )" >/dev/null && pwd)"
cd "${CURRENT_DIR}"
 
# Create docker image
TAG="freightnetwork/elpine-xml"
docker build --tag=$TAG .
docker push $TAG

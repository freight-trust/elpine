#!/bin/sh
docker run -ti --rm -v $(pwd):/apps -w /apps ${IMAGE}/${CONTAINER} sh -c "xq .< ${XML_FILE}.xml"

#!/usr/bin/env bash

dt=$(date "+%Y-%m-%d")
rm -rf public

docker build -t registry.ng.bluemix.net/rtiffany/blogtinylab:"$dt" .

docker push registry.ng.bluemix.net/rtiffany/blogtinylab:"$dt"

kubectl set image deployment/tinylab-deployment tinylab-nginx=registry.ng.bluemix.net/rtiffany/blogtinylab:"$dt"

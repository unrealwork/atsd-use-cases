#!/usr/bin/env bash

docker rm -f atsd-sandbox

if [ -d tutorial ]; then
    rm -rf tutorial
fi

mkdir tutorial && cd ./tutorial
touch slack.properties && printf "token=xoxb-351955888532-UXbCuiWo2v78lJmHAbE1d8U9\nchannels=general\n" > slack.properties
docker run -d -p 8443:8443 -p 9443:9443 -p 8081:8081 \
  --name=atsd-sandbox \
  --volume $(pwd):/import \
  --env TOP_DOMAIN=axibase.com \
  --env ATSD_IMPORT_PATH='https://raw.githubusercontent.com/axibase/atsd-use-cases/dev-howto-monitor-ssl-for-domains/how-to/atsd-sandbox/monitor-ssl-expiry-dates/resources/ssl-certificates-files.tar.gz' \
  --env COLLECTOR_IMPORT_PATH='https://raw.githubusercontent.com/axibase/atsd-use-cases/dev-howto-monitor-ssl-for-domains/how-to/atsd-sandbox/monitor-ssl-expiry-dates/resources/job_http_subdomains-ssl-certificates.xml' \
  --env SLACK_CONFIG="slack.properties" \
  axibase/atsd-sandbox:latest
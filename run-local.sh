#!/bin/bash -x

THIS_SCRIPT=$(basename -- "$0")
WORKDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
echo Running $THIS_SCRIPT at $WORKDIR

CONSOLE_URL=https://console-openshift-console.apps.cluster-d5hbk.d5hbk.sandbox613.opentlc.com
CONTENT_URL_PREFIX="file:///app-data/"
KEYCLOAK_PRE_URL=-rfelix.apps.cluster-6lc2p.6lc2p.sandbox921.opentlc.com
LOG_TO_STDOUT='true'
MASTER_URL=https://api.cluster-6lc2p.6lc2p.sandbox921.opentlc.com:6443
ROUTE_SUBDOMAIN=apps.cluster-6lc2p.6lc2p.sandbox921.opentlc.com
OPENSHIFT_USER_PASSWORD=openshift
WORKSHOPS_URLS="file:///app-data/_workshop_m1.yml"

docker run -it -p 8080:8080 --rm -v ${WORKDIR}/docs:/app-data \
-e CONSOLE_URL=${CONSOLE_URL} \
-e CONTENT_URL_PREFIX=${CONTENT_URL_PREFIX} \
-e KEYCLOAK_PRE_URL=${KEYCLOAK_PRE_URL} \
-e LOG_TO_STDOUT=${LOG_TO_STDOUT} \
-e MASTER_URL=${MASTER_URL} \
-e OPENSHIFT_USER_PASSWORD=${OPENSHIFT_USER_PASSWORD} \
-e ROUTE_SUBDOMAIN=${ROUTE_SUBDOMAIN} \
-e WORKSHOPS_URLS=${WORKSHOPS_URLS} \
    quay.io/jamesfalkner/workshopper


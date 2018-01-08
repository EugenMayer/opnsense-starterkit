#!/bin/sh
opnsense-update

. /root/provision_envs
echo "Fetching conf file: $CONF_FILE_URL"
curl "$CONF_FILE_URL" > /conf/config.provisioned
cp /conf/config.provisioned /conf/config.xml
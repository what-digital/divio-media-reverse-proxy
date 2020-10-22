#!/bin/bash
set -e

echo "trying to activate a nginx config for ${STAGE}...";
if [[ -e "/sites/${STAGE}.conf" ]]; then
  cp /sites/${STAGE}.conf /etc/nginx/conf.d/default.conf
  echo "found ${STAGE}.conf!";
else
  echo "no nginx configuration found for ${STAGE}, falling back to local.conf"
fi

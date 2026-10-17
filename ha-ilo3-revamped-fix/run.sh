#!/bin/bash
set -e

ILO_IP=$(jq --raw-output '.ilo_ip' /data/options.json)

echo "🚀 Start on HA iLO3 Revamped Fix (Nginx Engine) to: $ILO_IP"

sed -i "s/ILO_IP_ADDRESS/$ILO_IP/g" /etc/nginx/sites-available/ilo-proxy.conf

exec nginx -g "daemon off;"

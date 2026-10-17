#!/bin/bash
set -e

ILO_IP=$(jq --raw-output '.ilo_ip' /data/options.json)

echo "🚀 Стартиране на iLO 3 Proxy (Nginx Engine) към адрес: $ILO_IP"

sed -i "s/ILO_IP_ADDRESS/$ILO_IP/g" /etc/nginx/sites-available/ilo-proxy.conf

exec nginx -g "daemon off;"

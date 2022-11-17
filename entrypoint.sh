#!/bin/sh

set -e

ENDPOINT_UPDATE_INTERVAL=3600
ENDPOINT_COUNT=30
ENDPOINT_FORMAT="haproxy"
ENDPOINT_LIST=$( wget -qO- 'https://api.extrnode.com/endpoints?limit='${ENDPOINT_COUNT}'&format='${ENDPOINT_FORMAT}'&node_type=full_rpc' | awk '{printf "%s" " " ,$0}' ) caddy run --config /etc/caddy/Caddyfile --adapter caddyfile &

echo "Endpoint list: ${ENDPOINT_LIST}"

while true
do
	sleep "${ENDPOINT_UPDATE_INTERVAL}"
	ENDPOINT_LIST=$( wget -qO- 'https://api.extrnode.com/endpoints?limit='${ENDPOINT_COUNT}'&format='${ENDPOINT_FORMAT}'&node_type=full_rpc' | awk '{printf "%s" " " ,$0}' ) caddy reload --config /etc/caddy/Caddyfile
done

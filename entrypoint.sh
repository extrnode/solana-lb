#!/bin/sh

set -e

ENDPOINT_LIST=$(wget -qO- 'https://api.extrnode.com/endpoints?limit=30&format=haproxy&node_type=full_rpc' | awk '{printf "%s" " " ,$0}') caddy run --config /etc/caddy/Caddyfile --adapter caddyfile

exec "$@"

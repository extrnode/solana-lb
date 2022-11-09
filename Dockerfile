FROM caddy:2.6

COPY Caddyfile /etc/caddy/Caddyfile

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh

FROM caddy:2.6

COPY ./Caddyfile /etc/caddy/Caddyfile

COPY ./entrypoint.sh /etc/caddy/entrypoint.sh

RUN chmod +x /etc/caddy/entrypoint.sh

ENTRYPOINT /etc/caddy/entrypoint.sh

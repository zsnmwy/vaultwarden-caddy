FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM vaultwarden/server:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN chmod a+x /usr/bin/caddy

COPY vaultwarden.sh /etc/vaultwarden.sh

COPY Caddyfile /etc/caddy/Caddyfile

ENV ROCKET_ADDRESS=127.0.0.1

CMD ["/start.sh"]
FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4

FROM vaultwarden/server:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN chmod a+x /usr/bin/caddy

COPY vaultwarden.sh /etc/vaultwarden.sh

COPY Caddyfile /etc/caddy/Caddyfile

RUN sed -i "s@http://deb.debian.org/debian@http://mirrors.tencent.com/debian@g" /etc/apt/sources.list.d/debian.sources

ENV ROCKET_ADDRESS=127.0.0.1

CMD ["/start.sh"]
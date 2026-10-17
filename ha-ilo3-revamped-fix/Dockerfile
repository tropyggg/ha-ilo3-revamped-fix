FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    openssl \
    jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Генериране на self-signed сертификат за връзката между Home Assistant и Проксито
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=BG/O=HomeAssistant/CN=localhost"

RUN rm /etc/nginx/sites-enabled/default

COPY nginx-ilo.conf /etc/nginx/sites-available/ilo-proxy.conf
RUN ln -s /etc/nginx/sites-available/ilo-proxy.conf /etc/nginx/sites-enabled/

COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443

CMD [ "/run.sh" ]

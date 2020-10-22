FROM nginx:latest
# https://hub.docker.com/_/nginx

# noop for legacy migration
RUN mkdir /app && \
    echo "#!/bin/bash" > /app/migrate.sh && \
    chmod +x /app/migrate.sh

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/nginx-config.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/nginx-config.sh

COPY nginx/sites/local.conf /etc/nginx/conf.d/default.conf
COPY nginx/sites /sites/

EXPOSE 80

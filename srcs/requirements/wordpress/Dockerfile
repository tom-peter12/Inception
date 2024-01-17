FROM alpine:3.18

RUN apk update && apk add --no-cache \
    php81-cli \
    php81-fpm \
    php81-pdo_mysql \
    php81-json \
    php81-curl \
    curl \
    mariadb-client \
    msmtp \
    && sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php81/php-fpm.d/www.conf

# Expose port 9000
EXPOSE 9000

# Copy setup script
COPY ./tools/setup_wp.sh /setup_wp.sh

# Set the entrypoint
ENTRYPOINT ["sh", "/setup_wp.sh"]

# Set the default command
CMD ["php-fpm8", "-F", "-R"]
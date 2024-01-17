# FROM alpine:3.18

# RUN apk update && apk add --no-cache \
#     php81-cli \
#     php81-fpm \
#     php81-pdo_mysql \
#     php81-json \
#     php81-curl \
#     curl \
#     mariadb-client \
#     msmtp \
#     && sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php81/php-fpm.d/www.conf

# # Expose port 9000
# EXPOSE 9000

# # Copy setup script
# COPY ./tools/setup_wp.sh /setup_wp.sh

# # Set the entrypoint
# ENTRYPOINT ["sh", "/setup_wp.sh"]

# # Set the default command
# CMD ["php-fpm8", "-F", "-R"]


FROM alpine:3.18

ARG PHP_VERSION=82 \
    DB_NAME \
    DB_USER \
    DB_PASS \
    WPADPASS \
    WPUSER1PASS

# Ensure repositories and installed packages are up to date
RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    wget \
    curl \
    php-phar \
    unzip

# Check the PHP-FPM configuration directory
RUN if [ -d "/etc/php${PHP_VERSION}/php-fpm.d" ]; then \
        sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
        sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
        sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf; \
    else \
        echo "PHP-FPM configuration directory not found"; \
        exit 1; \
    fi

# Clean up
RUN rm -f /var/cache/apk/*

# Set the working directory to the web root
WORKDIR /var/www

# Download and install WordPress
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar && php wp-cli.phar --info \
  && cp wp-cli.phar /usr/local/bin/wp

# Copy the WordPress setup script
COPY ./tools/setup_wp.sh /setup_wp.sh

# Define the container's entry point
ENTRYPOINT ["sh", "/setup_wp.sh"]

# Set the default command
CMD ["/usr/sbin/php-fpm8", "-F"]

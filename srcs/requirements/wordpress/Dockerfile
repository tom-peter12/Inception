# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/18 15:25:02 by tpetros           #+#    #+#              #
#    Updated: 2024/01/21 01:03:36 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

# Set environment variables to prevent prompts from apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Add Sury PHP repository for latest PHP versions
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | \
    tee /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

# Install PHP and necessary extensions
RUN apt-get update && apt-get install -y \
    php8.3-cli \
    php8.3-fpm \
    php8.3-mysql \
    php8.3-mysqli \
    php-json \
    php8.3-curl \
    curl \
    mariadb-client \
    sendmail \
    && rm -rf /var/lib/apt/lists/*


RUN service php8.3-fpm start


# Configure PHP-FPM to listen on TCP instead of Unix socket
RUN sed -i "s|listen = /run/php/php8.3-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.3/fpm/pool.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Copy the WordPress setup script to the container
COPY ./tools/setup_wp.sh /setup_wp.sh

# Set the entry point to the WordPress setup script
ENTRYPOINT ["sh", "setup_wp.sh"]

# Default command: start PHP-FPM in the foreground
CMD ["php-fpm8.3", "-F", "-R"]

# Reset environment variables
ENV DEBIAN_FRONTEND=dialog

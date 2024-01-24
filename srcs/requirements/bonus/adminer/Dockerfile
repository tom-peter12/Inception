# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/24 09:52:26 by tpetros           #+#    #+#              #
#    Updated: 2024/01/24 13:04:05 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | \
    tee /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt-get update && \
    apt-get install -y \
        apache2 \
        libapache2-mod-php8.3 \
        php8.3-cli \
        php8.3-fpm \
        php8.3-mysql \
        php8.3-mysqli \
        php-json \
        php8.3-curl \
        curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && \
    rm -rf /var/www/html/index.html && \
    wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php

RUN sed -i -e "s|Listen 80|Listen 8080|g" /etc/apache2/ports.conf && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i -e "s|DocumentRoot /var/www/html|DocumentRoot /var/www/html|g" /etc/apache2/sites-available/000-default.conf && \
    sed -i -e "s|<Directory /var/www/html>|<Directory /var/www/html>|g" /etc/apache2/sites-available/000-default.conf

RUN a2enmod php8.3
RUN a2enmod rewrite

EXPOSE 8080

CMD ["apache2ctl", "-D", "FOREGROUND"]

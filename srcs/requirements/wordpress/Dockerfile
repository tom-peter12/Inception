# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/18 15:25:02 by tpetros           #+#    #+#              #
#    Updated: 2024/01/30 19:19:56 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN echo "deb https://packages.sury.org/php/ bullseye main" | \
    tee /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt-get update && apt-get install -y \
    php8.3-cli \
    php8.3-fpm \
    php8.3-mysql \
    php8.3-mysqli \
    php-json \
    php8.3-curl \
    curl \
    sendmail \
    && rm -rf /var/lib/apt/lists/*

RUN service php8.3-fpm start

RUN sed -i "s|listen = /run/php/php8.3-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.3/fpm/pool.d/www.conf

COPY ./tools/setup_wp.sh /setup_wp.sh

ENTRYPOINT ["sh", "setup_wp.sh"]

CMD ["php-fpm8.3", "-F", "-R"]

LABEL maintainer="Tomas Petros - Binaryminstrel.com" \
      version="1.0.0"

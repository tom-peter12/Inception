# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/18 15:25:02 by tpetros           #+#    #+#              #
#    Updated: 2024/01/18 15:25:03 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update && apt install wget gnupg -y

RUN echo "deb https://packages.sury.org/php/ bullseye main"\
 | tee /etc/apt/sources.list.d/sury-php.list

RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt update && apt upgrade -y && apt install -f -y \
    php8.0-cli\
    php8.0-fpm \
    php8.0-mysql \
    php-json \
    php8.0-curl curl \
    mariadb-client sendmail \
    && sed -i "s|listen = /run/php/php8.0-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.0/fpm/pool.d/www.conf

EXPOSE 9000

COPY ./tools/setup_wp.sh /setup_wp.sh

ENTRYPOINT ["sh", "setup_wp.sh"]

CMD ["php-fpm8.0", "-F", "-R"]

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 16:23:13 by tpetros           #+#    #+#              #
#    Updated: 2024/01/03 20:13:54 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18

RUN apk update && apk upgrade && apk add nginx openssl wget

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /var/run/nginx /etc/nginx/ssl /var/www/html

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/tpetros.42.ae.key \
    -out /etc/nginx/ssl/tpetros.42.ae.crt -days 365 -nodes \
    -subj "/C=AE/ST=ABUDHABI/L=MINA/O=42ABUDHABI/CN=tpetros.42.ae"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

EXPOSE 443

# CMD [ "nginx", "-g", "daemon off;" ]

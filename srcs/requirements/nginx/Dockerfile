# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/18 15:25:26 by tpetros           #+#    #+#              #
#    Updated: 2024/01/18 15:25:27 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/tpetros.key \
    -out /etc/nginx/ssl/tpetros.crt  \
    -subj "/C=AE/L=Abu Dhabi/O=42/OU=42AbuDhabi MED/CN=tpetros.42.fr"

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf

RUN chmod 644 /etc/nginx/http.d/nginx.conf

RUN chown -R nginx:nginx /etc/nginx/http.d


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

LABEL maintainer="Tomas Petros - Binarymister.com" \
      version="1.0.0"

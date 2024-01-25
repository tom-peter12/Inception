# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 16:25:24 by tpetros           #+#    #+#              #
#    Updated: 2024/01/18 15:24:05 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18

RUN apk update && apk upgrade &&\
    apk add --no-cache \
    apache2 \
    apache2-utils

COPY ./t-cv/* /var/www/localhost/htdocs/


RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

LABEL maintainer="Tomas Petros - Binarymister.com" \
      version="1.0.0"

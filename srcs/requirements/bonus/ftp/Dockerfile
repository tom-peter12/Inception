# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/25 00:00:45 by tpetros           #+#    #+#              #
#    Updated: 2024/01/30 19:28:15 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18

RUN	apk update && apk add --no-cache \
        vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/ftp.sh /tmp/ftp.sh

ENTRYPOINT ["sh", "/tmp/ftp.sh"]


LABEL maintainer="Tomas Petros - Binaryminstrel.com" \
      version="1.0.0"
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/24 00:14:05 by tpetros           #+#    #+#              #
#    Updated: 2024/01/24 01:38:19 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18

RUN apk --no-cache add curl tar

RUN curl -L https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz -o /tmp/portainer.tar.gz \
    && tar -xzf /tmp/portainer.tar.gz -C /usr/local/bin/ --strip-components=1 \
    && rm /tmp/portainer.tar.gz \
    && chmod +x /usr/local/bin/portainer

EXPOSE 9443

CMD ["portainer"]

LABEL maintainer="Tomas Petros - Binarymister.com" \
      version="1.0.0"

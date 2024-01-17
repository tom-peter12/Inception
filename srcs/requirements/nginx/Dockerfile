FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/tpetros.key \
    -out /etc/nginx/ssl/tpetros.crt  \
    -subj "/C=AE/L=Abu Dhabi/O=42/OU=42AbuDhabi MED/CN=tpetros.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

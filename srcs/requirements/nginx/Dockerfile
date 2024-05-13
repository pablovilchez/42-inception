FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx curl openssl tini

EXPOSE 443

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/inception.crt -subj "/C=ES/ST=Malaga/L=Malaga/O=42Malaga/CN=pvilchez.42.fr"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html && chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["nginx", "-g", "daemon off;"]
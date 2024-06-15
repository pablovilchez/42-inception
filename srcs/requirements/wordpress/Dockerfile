FROM debian:bullseye

RUN apt-get update -y && apt-get install -y apt-utils wget php7.4 php-fpm php-mysql mariadb-client tini

#EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools /var/www/
COPY ./tools/inception_page.html /var/www/html/inception_page.html

RUN chmod +x /var/www/wp_init.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["/var/www/wp_init.sh"]

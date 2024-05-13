FROM debian:bullseye

RUN apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client tini

RUN wget https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz && mv wordpress /var/www/ && rm latest.tar.gz

RUN mkdir -p /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

#EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools /var/www/
COPY ./tools/inception_page.html /var/www/html/inception_page.html

RUN chmod +x /var/www/wordpress_start.sh

#ENTRYPOINT ["/var/www/wordpress_start.sh"]
ENTRYPOINT ["/usr/bin/tini", "--"]

#CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
CMD ["/var/www/wordpress_start.sh"]

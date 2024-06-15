#!/bin/bash

	sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chmod -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.4-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress not found in host. Setting up..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;

	cp /var/www/wp-config.php /tmp/wp-config.php

	sed -i "s/MDB_DB_NAME/${MDB_DB_NAME}/" /tmp/wp-config.php
	sed -i "s/MDB_USER_NAME/${MDB_USER_NAME}/" /tmp/wp-config.php
	sed -i "s/MDB_USER_PASS/${MDB_USER_PASS}/" /tmp/wp-config.php
	sed -i "s/MDB_HOST/${MDB_HOST}/" /tmp/wp-config.php

	sed -i "s/WP_AUTH_KEY/${AUTH_KEY}/" /tmp/wp-config.php
	sed -i "s/WP_SECURE_A_KEY/${SECURE_A_KEY}/" /tmp/wp-config.php
	sed -i "s/WP_LOGGED_IN_KEY/${LOGGED_IN_KEY}/" /tmp/wp-config.php
	sed -i "s/WP_NONCE_KEY/${NONCE_KEY}/" /tmp/wp-config.php
	sed -i "s/WP_AUTH_SALT/${AUTH_SALT}/" /tmp/wp-config.php
	sed -i "s/WP_SECURE_A_SALT/${SECURE_A_SALT}/" /tmp/wp-config.php
	sed -i "s/WP_LOGGED_IN_SALT/${LOGGED_IN_SALT}/" /tmp/wp-config.php
	sed -i "s/WP_NONCE_SALT/${NONCE_SALT}/" /tmp/wp-config.php

  mv /tmp/wp-config.php /var/www/html/
	echo "Wordpress: creating users..."
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	echo "Wordpress: set up!"
  POST_CONTENT=$(< /var/www/html/inception_page.html)
  wp post create --post_type=page --post_title='Inception Page' --post_content="$POST_CONTENT" --post_status=publish --allow-root

fi

/usr/sbin/php-fpm7.4 --nodaemonize

exec "$@"
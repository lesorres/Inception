#!/bin/bash

# service php7.3-fpm start

echo HELLO

wp config create	--allow-root \
					--skip-check \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASSWORD \
					--dbhost=$DB_HOST \
					--dbprefix=wp_ \
					--path=/var/www/wordpress

sleep 10

# if [ ! -f /var/www/wordpress/wp-config.php ]
# then
echo HELLO2
wp core install		--allow-root \
					--url=$WP_URL \
					--title=my_site \
					--admin_user=$WP_ADMIN \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--path=/var/www/wordpress

echo HELLO3

wp user create bob	"bob@$WP_URL" \
					--allow-root \
					--role=author \
					--user_pass="1234" \
					--path=/var/www/wordpress
# fi

echo HELLO4

# service php7.3-fpm stop
/usr/sbin/php-fpm7.3 -F --nodaemonize
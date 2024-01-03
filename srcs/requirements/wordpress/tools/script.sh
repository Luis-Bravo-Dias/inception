#!/bin/bash

sleep 5

if [ ! -f "/var/www/html/wp-config.php" ]; then
	if cd /var/www/html && wp core download --allow-root

	then
	wp config create --allow-root \
		--path=/var/www/html/ \
		--dbname=$$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=$SQL_HOST \
		&& \
		wp core install \
		--allow-root \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--url=$WP_URL \
		&& \
		wp user create \
		--allow-root \
		$WP_USR_NAME $WP_USR_MAIL --user_pass=$WP_USR_PASS
	fi
fi

exec "$@"

# if [ ! -f "/var/www/html/wp-config.php" ]; then
# 	if cd /var/www/html && wp core download --allow-root
	
# 	then
# 	wp config create --allow-root \
# 			--path=/var/www/html/ \
# 			--dbname=$SQL_DATABASE \
# 			--dbuser=$SQL_USER \
# 			--dbpass=$SQL_PASSWORD \
# 			--dbhost=$SQL_HOST \
# 			&& \
# 			wp core install \
# 			--allow-root \
# 			--title=$WP_TITLE \
# 			--admin_user=$WP_ADMIN_USER \
# 			--admin_password=$WP_ADMIN_PASS \
# 			--admin_email=$WP_ADMIN_EMAIL \
# 			--url=$WP_URL \
# 			&& \
# 			wp user create \
# 			--allow-root \
# 			$WP_USR_NAME $WP_USR_MAIL --user_pass=$WP_USR_PASS
# 	fi
# fi

# exec "$@"
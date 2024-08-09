# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config_wp.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/07 14:57:52 by npatron           #+#    #+#              #
#    Updated: 2024/08/09 20:12:28 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

if [ -n "$DB_NAME" ]; then
	sed -i "s|define( 'DB_NAME', 'database_name_here' );|define( 'DB_NAME', '$DB_NAME' );|" /var/www/html/wp-config.php
	if [ -n "$DB_USER" ]; then
		sed -i "s|define( 'DB_USER', 'username_here' );|define( 'DB_USER', '$DB_USER' );|" /var/www/html/wp-config.php
		if [ -n "$DB_PASSWORD" ]; then
    		sed -i "s|define( 'DB_PASSWORD', 'password_here' );|define( 'DB_PASSWORD', '$DB_PASSWORD' );|" /var/www/html/wp-config.php
		fi
	fi
fi

sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/" /var/www/html/wp-config.php

until wp db check --allow-root --path=/var/www/html; do
    sleep 5
    echo "Retrying..."
done

wp core install --allow-root --path=/var/www/html --url=https://localhost/index.php --title=Myhtml --admin_user=$WP_ADMINUSER --admin_password=$WP_ADMINPASSWORD --admin_email=$WP_ADMINEMAIL

exec php-fpm7.3 -F
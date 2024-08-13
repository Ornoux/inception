# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config_wp.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/07 14:57:52 by npatron           #+#    #+#              #
#    Updated: 2024/08/12 22:26:20 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

if [ -n "$DB_NAME" ]; then
	sed -i "s|define( 'DB_NAME', 'votre_nom_de_bdd' );|define( 'DB_NAME', '$DB_NAME' );|" /var/www/wordpress/wp-config.php
	if [ -n "$DB_USER" ]; then
		sed -i "s|define( 'DB_USER', 'votre_utilisateur_de_bdd' );|define( 'DB_USER', '$DB_USER' );|" /var/www/wordpress/wp-config.php
		if [ -n "$DB_PASSWORD" ]; then
    		sed -i "s|define( 'DB_PASSWORD', 'votre_mdp_de_bdd' );|define( 'DB_PASSWORD', '$DB_PASSWORD' );|" /var/www/wordpress/wp-config.php
		fi
	fi
fi

sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/" /var/www/wordpress/wp-config.php

until wp db check --allow-root --path=/var/www/wordpress; do
    sleep 5
    echo "Retrying..."
done

wp core install --allow-root --path=/var/www/wordpress --url=$DOMAIN --title=MyWordpress --admin_user=$WP_ADMINUSER --admin_password=$WP_ADMINPASSWORD --admin_email=$WP_ADMINEMAIL

wp user create nico ornaxgame@gmail.com --path=/var/www/wordpress --role=contributor --user_pass=1234 --display_name=ornoux --allow-root


usr/sbin/php-fpm7.3 -F
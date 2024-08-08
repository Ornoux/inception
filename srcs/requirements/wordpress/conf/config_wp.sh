# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config_wp.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/07 14:57:52 by npatron           #+#    #+#              #
#    Updated: 2024/08/07 14:58:06 by npatron          ###   ########.fr        #
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

sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306' );/" /var/www/wordpress/wp-config.php

wp core install  --debug --force --allow-root --path='/var/www/wordpress' --allow-root --url=https://npatron.42.fr --title=MonWordpress --admin_user=$WP_ADMINUSER --admin_password=$WP_ADMINPASSWORD --admin_email=$WP_ADMINEMAIL
wp user create   --debug --force --allow-root $WP_USER $WP_EMAIL --role=$WP_ROLE --user_pass=$WP_PASSWORD --first_name="Ornax" --last_name="Valorant"

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

echo "clear_env = no" >> /etc/php/7.3/fpm/pool.d/www.conf
sed -i 's#listen = /run/php/php7.3-fpm.sock#listen=wordpress:9000#' \ 
        /etc/php/7.3/fpm/pool.d/www.conf

sed -i "s/define( 'DB_NAME', 'votre_nom_de_bdd' );/define( 'DB_NAME', '$DB_NAME' );/" /var/www/wordpress/wp-config-sample.php
sed -i "s/define( 'DB_USER', 'votre_utilisateur_de_bdd' );/define( 'DB_USER', '$DB_USER' );/" /var/www/wordpress/wp-config-sample.php
sed -i "s/define( 'DB_PASSWORD', 'votre_mdp_de_bdd' );/define( 'DB_PASSWORD', '$DB_PASSWORD' );/" /var/www/wordpress/wp-config-sample.php


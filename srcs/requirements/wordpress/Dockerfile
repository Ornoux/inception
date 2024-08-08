# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npatron <npatron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/27 17:32:40 by npatron           #+#    #+#              #
#    Updated: 2024/08/07 15:16:23 by npatron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV DB_NAME=$DB_NAME
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
# ENV WP_USER=$WP_USER
# ENV WP_TITLE=$WP_TITLE
# ENV WP_PASSWORD=$WP_PASSWORD
# ENV WP_EMAIL=$WP_EMAIL
# ENV WP_ADMINEMAIL=$WP_ADMINEMAIL
# ENV WP_ADMINPASSWORD=$WP_ADMINPASSWORD
# ENV WP_ADMINUSER=$WP_ADMINUSER
# ENV WP_ROLE=$WP_ROLE

RUN echo "WordPress CONTAINER : Installation of new packages..." && \
    apt-get update -y && apt-get upgrade -y && \
    echo "WordPress CONTAINER : Installation of wget..." && \
    apt-get install wget -y && \
    apt-get install gettext-base -y && \
    echo "WordPress CONTAINER : Installing PHP..." && \
    apt-get install -y \
        php7.3 \
        php-mysql \
        php-fpm \
        mariadb-client && \
        bash && \
    echo "WordPress CONTAINER : Downloading WordPress..." && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz && \
    mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress && \
    mkdir -p /etc/conf/ && \
    mkdir -p /run/php && chown www-data:www-data /run/php && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY /conf/config_wp.sh /etc/conf/
COPY /conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf


RUN chmod +x /etc/conf/config_wp.sh && \
    bash /etc/conf/config_wp.sh

CMD ["php-fpm7.3", "-F"]

